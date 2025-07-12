#!/usr/bin/env zsh

# Sheldon plugin manager initialization
if type sheldon > /dev/null 2>&1; then
    eval "$(sheldon --config-dir $HOME/.zsh.d/sheldon source)"
fi
