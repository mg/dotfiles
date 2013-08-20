# java
set -xx JAVA_HOME usr/libexec/java_home

# hadoop
set -x HADOOP_VERSION Hadoop2
set -x HADOOP_HOME ~/Library/$HADOOP_VERSION
set -x PATH $PATH ~/bin $HADOOP_HOME/bin

# google go
set -x PATH $PATH /usr/local/go/bin
set -x GOROOT /usr/local/go
set -x GOBIN $GOROOT/bin
set -x GOPATH ~/Documents/GOPATH

# git
set -x PATH $PATH /usr/local/git/bin

# google dart
set -x PATH $PATH /Applications/dart/dart-sdk/bin

# google cloud sdk
set -x PATH $PATH /usr/local/google-cloud-sdk/bin

# android adk
set -x PATH $PATH /Applications/Android\ Studio.app/sdk/platform-tools

# mark functions
set MARKPATH $HOME/.marks
function jump
  cd $MARKPATH/$argv; or echo "No such mark: $argv"
end
function mark
  mkdir -p $MARKPATH; and ln -s (pwd) $MARKPATH/$argv
end
function unmark
  rm $MARKPATH/$argv
end
function marks
  ls -l $MARKPATH | cut -d' ' -f9-; and echo
end