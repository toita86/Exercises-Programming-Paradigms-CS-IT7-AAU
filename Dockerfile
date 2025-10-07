FROM debian:bookworm-slim

# Create a non-root user (same UID/GID as host user)
ARG USERNAME=$USERNAME
ARG USER_UID=$USER_UID
ARG USER_GID=$USER_GID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get install -y \
    git curl unzip build-essential software-properties-common ripgrep fd-find libgmp-dev

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage \
    && chmod u+x nvim-linux-x86_64.appimage \
    && ./nvim-linux-x86_64.appimage --appimage-extract \
    && mv squashfs-root /usr/local/nvim \
    && ln -s /usr/local/nvim/usr/bin/nvim /usr/local/bin/nvim \
    && rm nvim-linux-x86_64.appimage

RUN mkdir -p /home/$USERNAME/.local/share/ \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME/.local

USER $USERNAME

RUN curl https://get-ghcup.haskell.org -sSf | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 sh
RUN echo "source /home/$USERNAME/.ghcup/env" >> ~/.bashrc 

WORKDIR /workspace

