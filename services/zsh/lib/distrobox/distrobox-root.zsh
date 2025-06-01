boxroot() {
  distrobox "$1" --root
}

 box-app(){
    distrobox-export --app $@
 }

 box-bin(){
    distrobox-export --bin  $@
 }

 boxroot-enter(){
   distrobox-enter "$1" --root
 }