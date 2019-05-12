#!/bin/env fish

if ! type -q git
    echo "ERROR: Could not find 'git' command. Aborting '(status -f)'."
    exit
end

set base16_shell_dir "$HOME/.config/base16_shell"

# -----------------------------------------------------------------------------
# Base16 Shell
if ! test -d $base16_shell_dir
    git clone https://github.com/chriskempson/base16-shell.git $base16_shell_dir
end

# https://github.com/chriskempson/base16-shell/pull/154
# Temporarily load currently active theme directly
if test -e ~/.base16_theme
  eval sh '"'(realpath ~/.base16_theme)'"'
end

# set aliases, like base16_*...
for SCRIPT in $base16_shell_dir/scripts/*.sh
  set THEME (basename $SCRIPT .sh)
  function $THEME -V SCRIPT -V THEME
    eval sh '"'$SCRIPT'"'
    ln -sf $SCRIPT ~/.base16_theme
    set -x BASE16_THEME (string split -m 1 '-' $THEME)[2]
    echo -e "if !exists('g:colors_name') || g:colors_name != '$THEME'\n  colorscheme $THEME\nendif" >  ~/.vimrc_background
  end
end
# END Base16 Shell
# -----------------------------------------------------------------------------

function fish_reload --description 'Reload fish config'
    source $HOME/.config/fish/config.fish
end

function fish_greeting --description 'Override the default greet and tell me a fortune'
    echo Uptime: (uptime)
    echo Date: (date)
end