# enil-vim-dotfiles

My vim dofiles.
The configuration should work with vim, [MacVim] and gvim.

## Installation
Just run the `install.sh` script and it will symlink everything to the home directory.
I prefer to keep the git under `~/.dotfiles/vim`.

[Vundle] is used to manage plugins.
Vundle is installed as a submodule by the install script, and all plugins are checked out from their repos which
alleviates the need to run `PluginInstall` after the installation.

## Notes
*Sauce Code Powerline*, a variant of *Source Code Pro* patched for [Powerline] is used as GUI font, it can be found
in the [Powerline fonts] repo.

[MacVim]:          https://github.com/b4winckler/macvim
[Vundle]:          https://github.com/gmarik/Vundle.vim
[Powerline]:       https://github.com/powerline/powerline
[Powerline fonts]: https://github.com/powerline/fonts

