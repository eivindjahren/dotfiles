set -e
sudo apt install curl python3-pip python3-dev libfuse-dev ripgrep kitty suckless-tools clang clangd clang-tidy clang-format
#pip install isort black pynvim powerline-shell

curl -L https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage --output nvim.appimage
sudo mv nvim.appimage /usr/bin/
sudo chmod +x /usr/bin/nvim.appimage

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim.appimage 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim.appimage 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim.appimage 60
sudo update-alternatives --config editor
sudo update-alternatives --config x-terminal-emulator
