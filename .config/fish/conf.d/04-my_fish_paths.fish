if test -d $fzf_dir/bin
    set -gx fish_user_paths $fish_user_paths $fzf_dir/bin
end

if type -q n
    set -gx N_PREFIX $HOME/.n
    set -gx fish_user_paths $N_PREFIX/bin $fish_user_paths
end
