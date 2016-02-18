function condalist -d 'List conda environments.'
  for dir in (ls $HOME/anaconda3/envs)
    echo $dir
  end
end

function condactivate -d 'Activate a conda environment' -a cenv
  if test -z $cenv
    echo 'Usage: condactivate <env name>'
    return 1
  end

  # condabin will be the path to the bin directory
  # in the specified conda environment
  set condabin $HOME/anaconda3/envs/$cenv/bin

  # check whether the condabin directory actually exists and
  # exit the function with an error status if it does not
  if not test -d $condabin
    echo 'Environment not found.'
    return 1
  end

  # deactivate an existing conda environment if there is one
  if set -q __CONDA_ENV_ACTIVE
    deactivate
  end

  # save the current path
  set -xg DEFAULT_PATH $PATH

  # put the condabin directory at the front of the PATH
  set -xg PATH $condabin $PATH

  # this is an undocumented environmental variable that influences
  # how conda behaves when you don't specify an environment for it.
  # https://github.com/conda/conda/issues/473
  set -xg CONDA_DEFAULT_ENV $cenv

  # set up the prompt so it has the env name in it
  functions -e __original_fish_prompt
  functions -c fish_prompt __original_fish_prompt
  function fish_prompt
    set_color blue
    echo -n '('$CONDA_DEFAULT_ENV') '
    set_color normal
    __original_fish_prompt
  end

  # flag for whether a conda environment has been set
  set -xg __CONDA_ENV_ACTIVE 'true'
end

function deactivate -d 'Deactivate a conda environment'
  if set -q __CONDA_ENV_ACTIVE
    # set PATH back to its default before activating the conda env
    set -xg PATH $DEFAULT_PATH
    set -e DEFAULT_PATH

    # unset this so that conda behaves according to its default behavior
    set -e CONDA_DEFAULT_ENV

    # reset to the original prompt
    functions -e fish_prompt
    functions -c __original_fish_prompt fish_prompt
    functions -e __original_fish_prompt
    set -e __CONDA_ENV_ACTIVE
  end
end


# aliases so condactivate and deactivate can have shorter names
function ca -d 'Activate a conda environment'
  condactivate $argv
end

function cda -d 'Deactivate a conda environment'
  deactivate $argv
end


# complete conda environment names when activating
complete -c condactivate -xA -a "(condalist)"
complete -c ca -xA -a "(condalist)"
