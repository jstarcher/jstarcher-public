#/bin/sh

sh -c 'for i in /dev/ad*; do echo $i; cat $i | file -; echo ""; done'
