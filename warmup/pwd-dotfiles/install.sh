#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlink dotfiles
ln -sfv "${DOTFILES_DIR}/.tmux.conf" ~
