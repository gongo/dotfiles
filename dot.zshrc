# Local Variables:
# mode: sh
# eval: (sh-set-shell "zsh")
# End:



autoload -U compinit
compinit

zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*:options' description 'yes'

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

export EDITOR="emacs -q -nw"

alias -g em='emacsclient --tty'
alias ll="ls -l"

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

if [ -d $HOME/.zsh.d ] ; then
    source $HOME/.zsh.d/sheldon.zsh

    for s in $HOME/.zsh.d/autoloads/*.zsh ; do
        source "$s"
    done

    for s in $HOME/.zsh.d/functions/*.zsh ; do
        source "$s"
    done
fi
