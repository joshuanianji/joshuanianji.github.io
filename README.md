# joshuanianji.github.io

Code for my personal website.

## Run Locally

I'm using [asdf](https://asdf-vm.com/) to manage my Node.js version. You can install the correct version by running `asdf install` in the root of the project.

```
pnpm i
touch .env
pnpm dev
```

## Environment Variables

Create a `.env` file in the root of the project with the following variables.

```env
# optional - if you want to increase the rate limit for the GitHub API
GITHUB_TOKEN=your_github_pat
```

### `GITHUB_TOKEN`

My website uses the GitHub API to fetch data in my public repos. The calls should be cached but sometimes in development you might hit the rate limit. To increase the limit you can create a personal access token and add it to the `.env` file.

A PAT with read-only access to public repos is sufficient.
