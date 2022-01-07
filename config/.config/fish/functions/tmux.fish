function tmux
        tmux attach || tmux new $argv;
end