FROM debian:11 as elm-install
# npm install elm fails due to incompatible architecture

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl gzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && gunzip elm.gz \
    && chmod +x elm \
    && mv elm /usr/local/bin

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

# Install elm, elm-test and elm-format
RUN export DEBIAN_FRONTEND=noninteractive \
    && sudo -u ${USERNAME} npm install --global \
    elm-test@${ELM_TEST_VERSION} \
    elm-format@${ELM_FORMAT_VERSION} \
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
