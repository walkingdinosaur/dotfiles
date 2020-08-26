#!/bin/bash

CURDIR=$(cd $(dirname $0);pwd)
HOME_DIR=$HOME

echo $CURDIR
echo $HOME_DIR

function mkfile {
  FILENAME=$1
  if [ -f "${HOME_DIR}/${FILENAME}" ]; then
      rm -v ${HOME_DIR}/${FILENAME}
  fi
  ln -vs ${CURDIR}/${FILENAME} ${HOME_DIR}/${FILENAME}
}

function get_git_prompt {
  local url_1="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
  local url_2="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

  wget ${url_1} -O ${CURDIR}/.git-completion.bash
  wget ${url_2} -O ${CURDIR}/.git-prompt.sh
}

get_git_prompt


mkfile .vimrc
mkfile .bashrc
mkfile .git-completion.bash
mkfile .git-prompt.sh


