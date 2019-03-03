# Ayooby's Dotfiles

## What Is This?
This is my dotfiles configs it helps me to have a backup from them and you can take a look at it and help me to make this Repo be better.

## Preinstallation
1. [fzf](https://github.com/junegunn/fzf)
2. [AG](https://github.com/ggreer/the_silver_searcher)
3. [pathogen](https://github.com/tpope/vim-pathogen)


## A Fresh macOS Setup

(These configs will changes your settings, be careful)Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install.sh` to start the installation
8. Make sure Dropbox is set up and synced
9. Restore preferences by running `mackup restore`
10. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the `.zshrc` file.

## How to make a dot files?

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything which is needed to install my preffered setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy! :smile:

Read the blog post: https://driesvints.com/blog/getting-started-with-dotfiles

