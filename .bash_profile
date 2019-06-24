source ~/.bashrc
brew analytics off 2>&1 >/dev/null
export HOMEBREW_NO_SANDBOX=1
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henryhsue/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/henryhsue/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henryhsue/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/henryhsue/Downloads/google-cloud-sdk/completion.bash.inc'; fi
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/henryhsue/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/henryhsue/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/henryhsue/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/henryhsue/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
