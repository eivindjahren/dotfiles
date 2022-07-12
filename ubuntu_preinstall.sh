set -e
sudo apt install curl python-dev python3-pip python3-dev python3-pip

curl https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage --output nvim.appimage
sudo mv nvim.appimage /usr/bin/

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim.appimage 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim.appimage 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim.appimage 60
sudo update-alternatives --config editor

#kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
sudo cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
