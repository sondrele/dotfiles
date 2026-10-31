# change to newly created directory
function mkcd
    mkdir -p $argv[1]; and cd $argv[1]
end
