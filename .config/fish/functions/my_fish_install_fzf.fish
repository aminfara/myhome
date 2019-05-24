function my_fish_install_fzf
    if ! test -d $fzf_dir
        my_fish_print_with_line "Installing fzf . . ."
        git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
        $fzf_dir/install --key-bindings --no-completion --no-update-rc --no-bash --no-zsh --64
    else
        my_fish_print_error "fzf is already installed at: $fzf_dir"
    end
end
