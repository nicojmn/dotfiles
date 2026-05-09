function gsv --wraps='git status --verbose' --description 'alias gsv=git status --verbose'
    git status --verbose $argv
end
