# echo "In etc/zsh/exports/coreutils.zsh"

find-tilde-files(){
    find $@ -type f -name '*~' -exec rm -v {} \;
}