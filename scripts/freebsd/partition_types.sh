#/bin/sh

sh -c 'for i in /dev/ad*; do echo "", echo $i; echo ""; cat $i | file -; echo ""; done'
