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

    # Mac OS color settings
    alias ls="ls -G"
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias gls="gls --color=auto"

    # xammpp for Mac OS X
    if [ -e "/Applications/xampp" ]; then
        export PATH=$PATH:/Applications/XAMPP/bin
    fi

    # MATLAB 2014a
    if [ -e "/Applications/MATLAB_R2014a.app" ] ; then
        alias matlabc='/Applications/MATLAB_R2014a.app/bin/matlab -nodisplay'
    fi

    # LilyPond
    if [ -e "/Applications/LilyPond.app/" ] ; then
        PATH=$PATH:/Applications/LilyPond.app/Contents/Resources/bin
    fi

elif [ $(uname) = 'Linux' ] ; then
    # linux ls color settings
    if [ -e "~/src/src/dircolors-solarized/" ] ; then
        eval $(dircolors ~/src/dircolors-solarized/dircolors.ansi-universal)
    fi
    alias ls="ls --color=auto"

fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# user sudo
if [ $(cat /etc/passwd | grep webdev) ] ; then
    alias webdev="sudo su - webdev"
fi

# PATH
export PATH=$PATH:$HOME/lbin:/usr/local/sbin

#Java Compiler Config
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8


zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# composer
if [ -e $HOME/.composer ]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi

# anyenv
if [ -e $HOME/.anyenv ]; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init -)"
fi

