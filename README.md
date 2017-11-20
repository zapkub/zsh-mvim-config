# ZSH and VIM setup

## Usage
- Install `eslint`
```
  npm install eslint-config-standard --global
  npm install --save-dev eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node --global
```
- Install oh-my-zsh and mvim
  - https://github.com/robbyrussell/oh-my-zsh
  - mvim
  ```
  brew install mvim
  ## link mvim to terminal
  ln -s /usr/local/bin/mvim vim
  ```
- create symbolic link (or copy file) from `.zshrc` and `.vimrc` to your Home directory
- restart your terminal
- start `vim`

## Plugin
### zsh
- autocompletion
- pure theme
- hyper-snazzy color theme

### Vim
- Easymotion
- CtrlP with Fuzzy search (ignore space, vscode like)
- NerdTree with auto directory sync with file buffer (IDE Like)
- NerdTree ignore (.nerdtreeignore)
- powerline (air)
- support typescript completion (IDE Like)
- Comment <gcc>
- Monokai Theme (wait for hyper-snazzy port for vim)
- Tab space (2)
