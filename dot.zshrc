# -*-sh-*-

autoload -U colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

fpath=(~/.zsh/functions/ $fpath)

####################
# environment
####################

export LANG=ja_JP.UTF8
export LC_ALL=ja_JP.UTF-8
export EDITOR="emacs -q -nw"
export CVS_RSH=ssh
export CVSEDITOR=$EDITOR

alias -g L='| lv'
alias -g G='| grep'
alias -g X='| xargs'
alias -g em='emacsclient --tty'
alias ll="ls -l"
alias tmux="tmux -2"

##########
# path
##########

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# key bind like emacs
bindkey -e

# cd - [tab] で
# ディレクトリスタックを表示
setopt auto_pushd

# ディレクトリスタックにて重複するものは
# 古い方を削除する
setopt pushd_ignore_dups

# ディレクトリ名だけで cd
setopt auto_cd

# 補完候補を詰めて表示
setopt list_packed

setopt print_eightbit

# = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

# ビープ音を消す
setopt no_beep

# 補完候補表示時のビープ音を消す
setopt nolistbeep

# 履歴に実行時間を保存する
setopt extended_history

# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups

# 他のシェルのヒストリをリアルタイムで共有する
setopt share_history

# 余分なスペースを削除してヒストリに保存する
setopt hist_reduce_blanks

autoload -Uz add-zsh-hook chpwd_recent_dirs cdr

add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
zstyle ':filter-select' case-insensitive yes

source $DOTFILES_DIR/load-interactive

autoload -U compinit compdef
compinit -u

