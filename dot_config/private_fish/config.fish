if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose default-rgb
    starship init fish | source
    if test -f ~/.config/fish/abbrevations.fish
        source ~/.config/fish/abbrevations.fish
    end
    set -gx CDPATH ~/UCL/Master/master-thesis/:~/UCL/Master/M2/Q2
    set -gx EDITOR helix
end
eval (keychain --eval --quiet ~/.ssh/ingi_key)
