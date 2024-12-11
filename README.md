## Dotfiles repo
> **_NOTE_**: managed with GNU Stow
> 1. https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html
> 2. https://www.gnu.org/software/stow/

### Current contents
1. .zshrc
2. .gitconfig
3. .vimrc
4. ...

### Basic Usage
The directory structure of this dotfiles repo SHOULD match the directory structure of the target machine
so that the symlinks are created in the appropriate locations 

i.e.

$HOME/
├── .config/
│   ├── nvim/
│   │   └── ...
├── .gitconfig
├── .vimrc
├── .vim/
│   ├── autoload/
│   ├── colors/
│   └── plugin/
└── .tools/
    └── ...

would match exactly within this repo

1. Restow all packages
```bash
stow --verbose --target=$HOME --restow */
```
2. Delete all stowed symlinks
```bash
stow --verbose --target=$HOME --delete */
```
