# Once a day, print a one-line drift report from the dotfiles repo (if anything drifted).
# The repo is found by following this file's symlink, so the clone can live anywhere.
if status is-interactive
    set -l repo (string replace -r '/home/\.config/fish/conf\.d/dotfiles\.fish$' '' (path resolve (status filename)))
    set -l stamp ~/.cache/dotfiles-doctor
    if test -x $repo/scripts/doctor
        if not test -f $stamp; or test (math (date +%s) - (path mtime $stamp)) -gt 86400
            mkdir -p ~/.cache; and touch $stamp
            $repo/scripts/doctor --quiet
        end
    end
end
