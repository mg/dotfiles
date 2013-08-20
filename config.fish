# java
set -x JAVA_HOME usr/libexec/java_home

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

# prompt
set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑" 
set -g __fish_git_prompt_char_upstream_behind "↓" 
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow 
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green

set -g __fish_git_prompt_hide_untrackedfiles 1

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
