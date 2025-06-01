source_folder() {
    local folder="$1"
    [[ -d "$folder" ]] || return 1 # Ensure it's a valid directory

    for file in "$folder"/*(N); do
        [[ -f "$file" ]] && source "$file"
    done
}
