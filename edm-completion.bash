_edm_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _EDM_COMPLETE=complete $1 ) )
    return 0
}

complete -F _edm_completion -o default edm;
