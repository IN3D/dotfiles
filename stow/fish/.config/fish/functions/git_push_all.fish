function git_push_all --description "Push current branch to all git remotes"
    if not git rev-parse --is-inside-work-tree &>/dev/null
        echo "Not a git directory"
        return 1
    end

    for remote in (git remote)
        git push $remote
    end
end
