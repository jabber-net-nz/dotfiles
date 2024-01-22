_procs() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            "$1")
                cmd="procs"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        procs)
            opts="-h -V -a -o -d -r -l -t -w -W -i -c -p --help --version --and --or --nand --nor --list --thread --tree --watch --watch-interval --insert --only --sorta --sortd --color --theme --pager --interval --use-config --load-config --gen-config --gen-completion --gen-completion-out --no-header --debug <KEYWORD>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --watch-interval)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -W)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --insert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -i)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --only)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sorta)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sortd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "auto dark light" -- "${cur}"))
                    return 0
                    ;;
                --pager)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                --interval)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use-config)
                    COMPREPLY=($(compgen -W "default large" -- "${cur}"))
                    return 0
                    ;;
                --load-config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gen-completion)
                    COMPREPLY=($(compgen -W "bash elvish fish powershell zsh" -- "${cur}"))
                    return 0
                    ;;
                --gen-completion-out)
                    COMPREPLY=($(compgen -W "bash elvish fish powershell zsh" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _procs -o bashdefault -o default procs
