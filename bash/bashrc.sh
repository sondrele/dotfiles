# install: ~/.bashrc

# Paths
IDEA_HOME=/opt/idea
JAVA_HOME=/usr/bin/java
SCALA_HOME=/opt/scala
GRADLE_HOME=/usr/lib/gradle/2.10/
ACTIVATOR_HOME=$HOME/bin/activator-dist-1.3.7
CARGO_HOME=$HOME/.multirust/toolchains/stable/cargo/bin
ANDROID_HOME=$HOME/Android/Sdk

PATH=$PATH:$SCALA_HOME/bin:$IDEA_HOME/bin:$ACTIVATOR_HOME:$CARGO_HOME:$ANDROID_HOME/tools

# Used with Rust
LD_LIBRARY_PATH=/usr/local/lib
RUST_SRC_PATH=$HOME/.multirust/src/rust/src

# This path have to be exported in order to properly use .bashrc_common
export BASH_HOME="$HOME"

# load bash config common for local system and remote systems over ssh
[ -s "$BASH_HOME/.bashrc_common" ] && . "$BASH_HOME/.bashrc_common"
