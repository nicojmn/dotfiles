function git-push-broadcast --wraps="git push"
    set branch (git rev-parse --abbrev-ref HEAD)
    for r in (git remote)
        echo (set_color blue) "Pushing to $r..." (set_color normal)

        if string match -q true (git config --get remote.$r.mirror)
            git push --mirror $r; or begin
                echo (set_color red) "Failed to push mirror on $r"
                return 1
            end
        else
            git push "$r" "$branch"; or begin
                echo (set_color red) "Failed to push branch $branch on remote $r" (set_color normal)
                return 1
            end
        end
    end
    echo (set_color green) "Successfuly pushed all remotes !"
end
