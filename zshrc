# 強力な補完
autoload -Uz compinit
compinit

# language
export LANG=ja_JP.UTF-8

PROMPT='[%n@%m]%# '
RPROMPT='%F{white}%35<..<%~/%f'

# alias
# some more ls aliases
if [ $(uname) = 'Darwin' ] ; then
    alias ls="ls -G"
    if [ -e "~/src/src/dircolors-solarized/" ] ; then
        eval $(dircolors ~/src/dircolors-solarized/dircolors.ansi-universal)
    fi
elif [ $(uname) = 'Linux' ] ; then
    alias ls="ls --color=auto"
fi

alias gls="gls --color"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

if [ -e "/Applications/xampp" ]; then
    export PATH=$PATH:/Applications/XAMPP/bin
fi

if [ -e "/Applications/MATLAB_R2014a.app" ] ; then
    alias matlabc='/Applications/MATLAB_R2014a.app/bin/matlab -nodisplay'
fi

# PATH
export PATH=$PATH:$HOME/lbin:/usr/local/sbin

#Java Compiler Config
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# ls color
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# if [[ -s ~/.nvm/nvm.sh ]];then 
# 	source ~/.nvm/nvm.sh
# 	nvm use 0.10
# fi

# ### Virtualenvwrapper
# if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
# 	export WORKON_HOME=$HOME/.virtualenvs
# 	source /usr/local/bin/virtualenvwrapper.sh
# fi

# composer
if [ -e $HOME/.composer ]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi

# anyenv
if [ -d $HOME/.anyenv ]; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init -)"
fi

