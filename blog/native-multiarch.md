---
author: Joshua Ji
title: Native Multi-arch Docker Builds in Github Actions
description: How to use remote builders to build multi-arch Docker images natively
draft: false
published: "2024-12-12"
---

As we wait for Github's ARM-based Linux runners to be available, multi-arch Docker builds remain annoying to deal with if you want to avoid using QEMU. Fortunately, this becomes easy if you have an ARM-based machine machine at your disposal. 

In this article, we will use this machine as a _remote builder_ controlled by Docker Buildx on another machine (a Github Actions runner) to build our multi-arch images completely natively. 

What's especially nice about this approach is that we don't need to deal with manifest files, which would be necessary if we were to use a separate arm-based runner to build the arm images in parallel with the x86 images. 

## Accessing the ARM machine

We'll test that we can access the machine via docker first. I like using SSH configs, so here's mine:

```plaintext
# ~/.ssh/config
Host arm-vm
    HostName <IP>
    User <USERNAME>
    IdentityFile ~/.ssh/id_rsa
    UseKeychain yes
```

We use the format `ssh://<HOST>` to access the machine via Docker, or you can use `ssh://<USER>@<HOST>` if you're not using a config file.

```bash
> docker -H ssh://arm-vm info
Client:
 Version:    27.3.1
 Context:    default
 Debug Mode: false
 Plugins:
  ...

Server:
 Containers: 4
  Running: 2
  Paused: 0
  Stopped: 2
 Images: 15
 Server Version: 27.3.1
 ...
```

## Sample Github Actions Workflow

Now that the docker connection is working, here's a sample Github Actions workflow that does the following:

1. Sets up an SSH config file
2. Connects to the ARM machine via Docker Buildx as a remote builder
3. Builds an pushes the image to GHCR

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: 💻 Configure SSH
        shell: bash
        run: |
          mkdir -p ~/.ssh/
          echo "$SSH_PRIVATE_KEY" > ~/.ssh/deploy-key.pem
          chmod 600 ~/.ssh/deploy-key.pem
          cat >>~/.ssh/config <<END
          Host arm-vm
            HostName $SSH_IP
            User $SSH_USER
            IdentityFile ~/.ssh/deploy-key.pem
            StrictHostKeyChecking no
          END
        env:
          SSH_USER: ${{ inputs.SSH_USER }}
          SSH_PRIVATE_KEY: ${{ inputs.SSH_PRIVATE_KEY }}
          SSH_IP: ${{ inputs.SSH_IP }}
      
      - name: Check if the builder is reachable
        shell: bash
        run: docker -H ssh://arm-vm info

      # we are making the actions runner natively build the amd image, and use the arm machine to build the arm image via ssh
      # this allows us to still use build-push-action, but Docker will automatically choose which builder to use based on the platform
      - name: Setup Buildx Instances
        shell: bash
        run: |
          docker buildx create --use --name main-builder --platform=linux/amd64 --driver=docker-container
          docker buildx create --append --name=main-builder --platform=linux/arm64 ssh://arm-vm
          docker buildx inspect main-builder --bootstrap
          docker buildx ls

      - name: Login to GHCR
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/arm64,linux/amd64
          push: true
          tags: ghcr.io/${{ github.repository }}:latest
```

You can check out [joshuanianji/arm-docker-images](https://github.com/joshuanianji/arm-docker-images) for some more examples.

## Caching Pitfalls

I use this approach in my [idris-2-docker](https://github.com/joshuanianji/idris-2-docker) repo, but have struggled with proper caching. The issue _seems_ to be that both caches are being saved in the Github Actions cache and none on the remote builder, so we need a full build on the remote builder every time. 

Still, that hypothesis makes no sense in light of [this Stack Overflow answer](https://stackoverflow.com/a/76484761). Perhaps this is an issue with my workflow setup, so I guess I need to do some more digging.

