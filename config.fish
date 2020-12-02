function fish_prompt
    powerline-shell --shell bare $status
end

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

function fish_mode_prompt
end

alias import_fishrc='source ~/.config/fish/config.fish'
alias edit_fishrc='vi ~/.config/fish/config.fish'
alias l='ls -ltrah'
alias c='clear; ls -ltrah'
alias rm='rm -i'
alias act='. .venv/bin/activate.fish'
alias pg='ping google.com'
alias git_gpg_enable='git config commit.gpgsign true'

set JAVA_HOME /usr/lib/jvm/default-java
set  M2_HOME /home/pi/maven

set -Ua fish_user_paths /usr/local/go/bin
set -Ua fish_user_paths /home/pi/scripts
set -Ua fish_user_paths /home/pi/.local/bin
set -Ua fish_user_paths /home/pi/maven/bin

set -U fish_greeting ""

set -gx GPG_TTY (tty)

# opam configuration
source /home/pi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
