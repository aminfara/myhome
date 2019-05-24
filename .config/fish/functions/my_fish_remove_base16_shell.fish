function my_fish_remove_base16_shell
    if test -d $base16_shell_dir
        my_fish_print_with_line "Removing Base16 Shell . . ."
        rm ~/.vimrc_background
        rm ~/.base16_theme
        rm -rf $base16_shell_dir
    else
        my_fish_print_error "Cannot find Base16 Shell at: $base16_shell_dir"
    end
end
