#!/bin/bash

COLORS="normal black red green yellow blue magenta cyan white"

for FG in $COLORS ; do
        git log -1 --pretty="format:%C($FG)normal-$FG%Creset"
        git log -1 --pretty="%C(bold $FG)bold $FG%Creset"
        git log -1 --pretty="%C(dim $FG)dim $FG%Creset"
        git log -1 --pretty="%C(ul $FG)ul $FG%Creset"
        git log -1 --pretty="%C(reverse $FG)reverse $FG%Creset"
        echo 
done


