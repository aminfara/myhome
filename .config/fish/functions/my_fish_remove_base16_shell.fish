function my_fish_remove_base16_shell
    if test -d $base16_shell_dir
        rm ~/.vimrc_background > /dev/null 2>&1
        rm ~/.base16_theme > /dev/null 2>&1
        rm -rf $base16_shell_dir > /dev/null 2>&1
    else
        my_fish_print_error "Cannot find Base16 Shell at: $base16_shell_dir"
    end
end
