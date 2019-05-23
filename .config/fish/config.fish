#!/bin/env fish

if ! type -q git
    echo "ERROR: Could not find 'git' command. Aborting '(status -f)'."
    exit
end

# -----------------------------------------------------------------------------
# Fzf
if ! test -d $fzf_dir
    print_line "Installing Fzf . . ."
    git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
    $fzf_dir/install --key-bindings --completion --no-update-rc
end
# END Fzf
# -----------------------------------------------------------------------------

function fish_reload --description 'Reload fish config'
    source $HOME/.config/fish/config.fish
end

function fish_greeting --description 'Override the default greet and tell me a fortune'
    echo Uptime: (uptime)
    echo Date: (date)  🐠
end
