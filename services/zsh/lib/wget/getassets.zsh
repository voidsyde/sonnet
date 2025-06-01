source "$ZSH_INIT/functions.zsh"

wget-svg() {
    local link="$1"
    [[ -n "$link" ]] && wgetcustom "$link"
}


wget-png(){
    local link="$1"
    [[ -n "$link" ]] && wgetcustom "$link"
}