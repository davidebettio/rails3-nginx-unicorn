
# locale
export LANGUAGE="it"
export LANG="C"
export LC_MESSAGES="C"

# rbenv
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

