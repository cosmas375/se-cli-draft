_se_completions()
{
 	COMPREPLY=()

 	npm_command_options="build serve"
    npm_command="${COMP_WORDS[1]}"

 	if [[ ${COMP_CWORD} -eq 1 ]] ; then
 		COMPREPLY=( $(compgen -W "${npm_command_options}" -- ${npm_command}) )
 		return 0
 	fi

    frontend_sections_options=$(sh $(dirname "$0")/bin/get_sections_list.sh)

    COMPREPLY=( $(compgen -W "${frontend_sections_options}" -- ${COMP_WORDS[COMP_CWORD]}) )
}

complete -F _se_completions se
