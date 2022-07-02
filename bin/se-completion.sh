if test -e ~/.bashrc
then
    CONFIG_PATH=~/.bashrc
elif test -e ~/.zshrc
then
    CONFIG_PATH=~/.zshrc
fi

SE_FRONT_DIRECTORY='SE_FRONT_DIRECTORY'
FRONT_PATH=$(grep "^$SE_FRONT_DIRECTORY=" $CONFIG_PATH | sed "s/$SE_FRONT_DIRECTORY=//g")
SECTIONS_JSON_PATH="$FRONT_PATH/sections.json"

_se_completions()
{
    COMPREPLY=()

    npm_command="${COMP_WORDS[1]}"
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ ${COMP_CWORD} -eq 1 ]]
    then
        if [[ ${cur} == -* ]]
        then
            COMPREPLY=( $(compgen -W "-h --help" -- ${cur}) )
        else
            COMPREPLY=( $(compgen -W 'build serve' -- ${npm_command}) )
        fi
        return 0
    fi

    if [[ ${prev} == 'build' && ${cur} == -* ]]
    then
        COMPREPLY=( $(compgen -W "-t --threads" -- ${cur}) )
        return 0
    fi

    case $prev in
        -t|--threads)
            COMPREPLY=( $(compgen -W "4" -- ${cur}) )
            return 0
            ;;
    esac

    frontend_sections_options=`grep -o '"[a-zA-Z0-9]*":[^{]*{' $SECTIONS_JSON_PATH | grep '[a-zA-Z0-9]' | tr -d '{ "\n' | sed 's/:/ /g'`
    COMPREPLY=( $(compgen -W "${frontend_sections_options}" -- ${cur}) )
}

complete -F _se_completions se
