function my_fish_activate_base16_shell
    if test -d $base16_shell_dir
        # https://github.com/chriskempson/base16-shell/pull/154
        # Temporarily load currently active theme directly
        # set aliases, like base16_*...
        for SCRIPT in $base16_shell_dir/scripts/*.sh
            set THEME (basename $SCRIPT .sh)
            function $THEME -V SCRIPT -V THEME
                eval sh '"'$SCRIPT'"'
                ln -sf $SCRIPT ~/.base16_theme
                set -x BASE16_THEME (string split -m 1 '-' $THEME)[2]
                echo -e "if !exists('g:colors_name') || g:colors_name != '$THEME'\n  colorscheme $THEME\nendif" >~/.vimrc_background
            end
        end

        if test -e ~/.base16_theme
            eval sh '"'(realpath ~/.base16_theme)'"'
        else
            base16-solarized-dark
        end
    else
        my_fish_print_error "Cannot find Base16 Shell at: $base16_shell_dir"
    end
end
