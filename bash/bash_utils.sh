# a collection of smaller utilities that might have, or might once have had, a value

is_installed() {
    if hash "$1" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# function to copy the last downloaded contents to a given directory
function cpd {
  DEST=$1
  NUM=$2
  if [[ $# -eq 2 ]]; then
    ls -lrt "$HOME/Downloads/" | tail -n $NUM | awk '{print $NF }' | xargs -I{} cp "$HOME/Downloads/{}" "$DEST"
  elif [[ $# -eq 1 ]]; then
    ls -lrt "$HOME/Downloads/" | tail -n 1 | awk '{print $NF }' | xargs -I{} cp "$HOME/Downloads/{}" "$DEST"
  else
    ls -lrt "$HOME/Downloads/" | tail -n 1 | awk '{print $NF }' | xargs -I{} cp "$HOME/Downloads/{}" .
  fi
}

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

