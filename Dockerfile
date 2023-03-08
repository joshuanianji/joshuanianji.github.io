FROM mcr.microsoft.com/devcontainers/javascript-node:18

# Configuring Elm version
ARG ELM_VERSION=latest-0.19.1
ARG ELM_TEST_VERSION=latest-0.19.1
ARG ELM_FORMAT_VERSION=latest-0.19.1

# This Dockerfile adds a non-root user with sudo access. Update the “remoteUser” property in
# devcontainer.json to use it. More info: https://aka.ms/vscode-remote/containers/non-root-user.
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN export DEBIAN_FRONTEND=noninteractive \
    # [Optional] Update UID/GID if needed
    && if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
    groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME; \
    fi \
    # Create the elm cache directory where we can mount a volume. If we don't create it like this
    # it is auto created by docker on volume creation but with root as owner which makes it unusable.
    && mkdir /home/$USERNAME/.elm \
    && chown $USERNAME:$USERNAME /home/$USERNAME/.elm \
    # also create cypress cache directory, for the same reason
    && mkdir -p /home/$USERNAME/.cache/Cypress \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.cache

# cypress dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
