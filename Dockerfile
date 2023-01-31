# This dockerfile sets up the devcontainer for this project
# It is based on the official elm dockerfile, but modified to work on arm64
# Note that some of these steps (e.g. elm-format-install) take a long time, so I prebuild this on Github Actions

FROM debian:11 as elm-install
# npm install elm fails due to incompatible architecture

RUN apt-get update && apt install curl gzip -y

RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && gunzip elm.gz \
    && chmod +x elm \
    && mv elm /usr/local/bin

FROM haskell:9.0.2-buster as elm-format-install 
# elm-format also doesn't have arm64 binaries: https://github.com/avh4/elm-format/issues/714
# https://github.com/avh4/elm-format/issues/723
RUN cabal update 
RUN git clone --depth 1 --branch patch-1 https://github.com/tfausak/elm-format.git \
    && cd elm-format \
    && ./build.sh -- build

FROM mcr.microsoft.com/devcontainers/javascript-node:16

# Configuring Elm version
ARG ELM_VERSION=latest-0.19.1
ARG ELM_TEST_VERSION=latest-0.19.1
ARG ELM_FORMAT_VERSION=latest-0.19.1

# This Dockerfile adds a non-root user with sudo access. Update the “remoteUser” property in
# devcontainer.json to use it. More info: https://aka.ms/vscode-remote/containers/non-root-user.
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# move elm from elm-install stage
COPY --from=elm-install /usr/local/bin/elm /usr/local/bin/elm
# move elm-format from elm-format-install stage
COPY --from=elm-format-install /elm-format/_build/elm-format /usr/local/bin/elm-format

# Install elm-test, as elm-test is the only package that also supports arm64 (it's built with elm so it's architecture independent)
RUN export DEBIAN_FRONTEND=noninteractive \
    && sudo -u ${USERNAME} npm install --global \
    elm-test@${ELM_TEST_VERSION} \ 
    #
    # [Optional] Update UID/GID if needed
    && if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
    groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME; \
    fi \
    # Create the elm cache directory where we can mount a volume. If we don't create it like this
    # it is auto created by docker on volume creation but with root as owner which makes it unusable.
    && mkdir /home/$USERNAME/.elm \
    && chown $USERNAME:$USERNAME /home/$USERNAME/.elm
