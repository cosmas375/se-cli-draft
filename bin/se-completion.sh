_se_completions()
{
    COMPREPLY=()

    npm_command_options="build serve"
    npm_command="${COMP_WORDS[1]}"

    if [[ ${COMP_CWORD} -eq 1 ]] ; then
        COMPREPLY=( $(compgen -W "${npm_command_options}" -- ${npm_command}) )
        return 0
    fi

    frontend_sections_options=$(grep -o '"[a-zA-Z0-9]*":[^{]*{' ./sections.json | grep '[a-zA-Z0-9]' | tr -d '{ "\n' | sed 's/:/ /g')

    COMPREPLY=( $(compgen -W "${frontend_sections_options}" -- ${COMP_WORDS[COMP_CWORD]}) )
}

complete -F _se_completions se
