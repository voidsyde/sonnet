#!/bin/sh

# find
# alias find-tilde="find $@ -type f -name '*~' -exec rm -v {} \;"

find_tilde(){
    find $@ -type f -name '*~' -exec rm -v {} \;
}