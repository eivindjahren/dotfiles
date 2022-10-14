#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p ~/.config/nvim/
ln -sf -t ~/.config/nvim/ $DIR/nvim/*
mkdir -p ~/.config/kitty/
ln -sf -t ~/.config/kitty/ $DIR/kitty/*
ln -sf $DIR/xmobarrc ~/.xmobarrc
ln -sf $DIR/xsessionrc ~/.xsessionrc
ln -sf $DIR/xmonad ~/.xmonad
