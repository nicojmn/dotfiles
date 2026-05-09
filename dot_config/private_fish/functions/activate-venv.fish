function activate-venv --wraps source -d "Find .venv starting from current dir to parents dir until found and activate it"
    set current_dir (realpath pwd)
    while not test -f "$current_dir/.venv/bin/activate.fish"
        if test "$current_dir" = /
            echo (set_color red)"No .venv found, stopping at root !"
            return
        end

        set current_dir (dirname $current_dir)
    end

    echo (set_color green) "Activate venv in : $current_dir/.venv/bin/activate.fish"
    source "$current_dir/.venv/bin/activate.fish"
end
