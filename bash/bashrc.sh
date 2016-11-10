# install: ~/.bashrc

# Paths
IDEA_HOME=/opt/idea
JAVA_HOME=/usr/bin/java
SCALA_HOME=/opt/scala
GRADLE_HOME=/usr/lib/gradle/2.10/
ACTIVATOR_HOME=$HOME/bin/activator-dist-1.3.7
ANDROID_HOME=$HOME/Android/Sdk

PATH=$PATH:$SCALA_HOME/bin:$IDEA_HOME/bin:$ACTIVATOR_HOME:$ANDROID_HOME/tools
export PATH="$HOME/.cargo/bin:$PATH"

# Used with Rust
LD_LIBRARY_PATH=/usr/local/lib

# This path have to be exported in order to properly use .bashrc_common
export BASH_HOME="$HOME"

# load bash config common for local system and remote systems over ssh
[ -s "$BASH_HOME/.bashrc_common" ] && . "$BASH_HOME/.bashrc_common"
