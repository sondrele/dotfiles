# install: ~/.bash_utils

# search for word in a PDF-file from a folder (defaulting to the current folder)
# example: pdfs "hallo" ../
function pdfs {
  dir="."
  if [ "$2" ]; then
    dir="$2";
  fi
  find "$dir" -iname "*.pdf" -exec pdfgrep -inH "$1" {} \;
}

# change to newly created directory
function mkcd {
    mkdir "$1"
    cd "$1"
}

# hot-switch
export HSPATH=$HOME/.hs
function hs {
    cd -P "$HSPATH/$1" 2>/dev/null || echo "No such hot-switch: $1"
}

function hsadd {
    mkdir -p "$HSPATH"; ln -s "$(pwd)" "$HSPATH/$1"
}

function hsrm {
    rm -i -f "$HSPATH/$1"
}

function hsli {
    ls -l "$HSPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

_completehs() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $HSPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

# Autocomplete for hot-switch commands
complete -F _completehs hs hsrm
