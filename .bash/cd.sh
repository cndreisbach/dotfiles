exists() {
  eval "which $1" > /dev/null
  local exit_status=$?
  return $exit_status
}

. ~/dotfiles/lib/cd/cd                      # enables extensible cd
. ~/dotfiles/lib/cd/cd-traverse             # enables descendant/ancestor traversal
. ~/dotfiles/lib/cd/cd-history              # ^, ^^, ^n, ^regexp
exists "sshfs" && . ~/dotfiles/lib/cd/cd-ssh                  # does nothing unless you have sshfs
exists "archivemount" && . ~/dotfiles/lib/cd/cd-archive              # does nothing unless you have archivemount
#. ~/dotfiles/lib/cd/cd-hdfs                 # does nothing unless you have hadoop-fuse-dfs
exists "yagfs" && . ~/dotfiles/lib/cd/cd-git                  # does nothing unless you have yagfs
exists "encfs" && . ~/dotfiles/lib/cd/cd-encfs                # does nothing unless you have encfs
. ~/dotfiles/lib/cd/cd-dev                  # enables automounting for /dev/ entries
#. ~/dotfiles/lib/cd/cd-missing-mkdir        # enables auto-mkdir
