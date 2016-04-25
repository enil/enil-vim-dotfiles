# enil-vim-dotfiles

My vim dofiles.
The configuration should work with vim, [MacVim] and gvim.

## Installation

Run `make install` and it will generate and symlink everything to the home directory.
I prefer to keep the git under `~/.dotfiles/vim`.

[Plug] is used to manage plugins.
Plug is installed as a submodule by the make script, and the plugins are installed to ~/.vim/bundle when vim first
starts (as long as the directory doesn't already exists).
Ignore any warnings at the start up, they're caused by the missing plugins.

## Notes

*Sauce Code Powerline*, a variant of *Source Code Pro* patched for [Powerline] is used as GUI font, it can be found
in the [Powerline fonts] repo.

[MacVim]:          https://github.com/b4winckler/macvim
[Plug]:            https://github.com/junegunn/vim-plug
[Powerline]:       https://github.com/powerline/powerline
[Powerline fonts]: https://github.com/powerline/fonts

