dotfiles
========

Nord Theme for terminal, tmux and vim
https://www.nordtheme.com/docs/ports/tmux/installation

## zsh
```
  sudo apt install zsh
  chsh -s /usr/bin/zsh alan
  echo $SHELL
```

### Spaceship ZSH
https://github.com/denysdovhan/spaceship-prompt
A Zsh prompt (for Astronauts apparently)
```
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
Then set ZSH_THEME="spaceship" in .zshrc.

Powerline fonts are also required
```
  sudo apt-get install powerline fonts-powerline
```

### ohmyzsh
https://github.com/ohmyzsh/ohmyzsh
A framework for managing zsh configurations
```
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

## tmux
tmux.conf Gets copied to working dir with install.sh

Need to install the plugin manager then reload tmux
```
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## nvim
https://github.com/neovim/neovim/wiki/Installing-Neovim
```
  sudo apt install neovim
```
config file init.vim copied to working dir with install.sh you need to run :PlugInstall

## gnome
Need to manually configure gnome fonts and select nord theme and powerline

## aliases
installed via install.sh

## snippets
installed via install.sh

## tools

### diff-so-fancy
https://github.com/so-fancy/diff-so-fancy
Good looking diffs

```
  installnpm i -g diff-so-fancy
```
Add to pathexport PATH="$HOME/.nvm/versions/node/v12.16.1/lib/node_modules/diff-so-fancy:$PATH"
Configure git to use it

```
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

### exa
https://github.com/ogham/exa
A modern version of 'ls'
You need Rush
```
  cargo install exa
```

### fd
A simple, fast and user-friendly alternative to 'find'
https://github.com/sharkdp/fd
```
  sudo apt install fd-find
```

### fzf
A general-purpose command-line fuzzy finder
https://github.com/junegunn/fzf
```
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
```
