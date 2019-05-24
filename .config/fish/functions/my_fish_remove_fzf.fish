function my_fish_remove_fzf
    if test -d $fzf_dir
        my_fish_print_with_line "Removing fzf . . ."
        rm -rf $fzf_dir
        rm $__fish_config_dir/functions/fzf_key_bindings.fish > /dev/null
    else
        my_fish_print_error "Cannot find fzf at: $fzf_dir"
    end
end
