FRONT_PATH=''
SE_FRONT_DIRECTORY='SE_FRONT_DIRECTORY'
if test -f ~/.bashrc
then
    FRONT_PATH=$(grep "^$SE_FRONT_DIRECTORY=" ~/.bashrc | sed "s/$SE_FRONT_DIRECTORY=//g")
elif test -f ~/.zshrc
then
    FRONT_PATH=$(grep "^$SE_FRONT_DIRECTORY=" ~/.zshrc | sed "s/$SE_FRONT_DIRECTORY=//g")
fi
SECTIONS_JSON_PATH="$FRONT_PATH/sections.json"

_se_completions()
{
    COMPREPLY=()

    npm_command_options="build serve"
    npm_command="${COMP_WORDS[1]}"
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ ${COMP_CWORD} -eq 1 ]]
    then
        COMPREPLY=( $(compgen -W "${npm_command_options}" -- ${npm_command}) )
        return 0
    fi

    if [[ ${COMP_WORDS[COMP_CWORD]} == -* ]]
    then
        COMPREPLY=( $(compgen -W "-t -h --threads --help" -- ${cur}) )
        return 0
    fi

    case $prev in
        -h|--help)
            return 0
            ;;
        -t|--threads)
            return 0
            ;;
    esac

    frontend_sections_options=`grep -o '"[a-zA-Z0-9]*":[^{]*{' $SECTIONS_JSON_PATH | grep '[a-zA-Z0-9]' | tr -d '{ "\n' | sed 's/:/ /g'`
    COMPREPLY=( $(compgen -W "${frontend_sections_options}" -- ${cur}) )
}

complete -F _se_completions se
