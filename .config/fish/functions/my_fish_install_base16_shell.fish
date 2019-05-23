function my_fish_install_base16_shell
    if ! test -d $base16_shell_dir
        my_fish_print_with_line "Installing Base16 Shell . . ."
        git clone https://github.com/chriskempson/base16-shell.git $base16_shell_dir
    else
        my_fish_print_error "Base16 Shell is already installed at: $base16_shell_dir"
    end
end
