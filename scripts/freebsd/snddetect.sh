#/bin/sh

# (c) 2008 Dmitry Klimov [TrueBSD Project] <lazyklimm@TrueBSD.org>
# (c) 2008 Sokolov Alexey [TrueBSD Project] <sokolov@TrueBSD.org>

if [ `whoami` != "root" ]; then
    echo "This utility should only be run as root"
    echo "Please use 'sudo $0' instead"
    sleep 3
    exit
fi

echo "Please wait..."

LOADERCONF=/boot/loader.conf

SNDSTAT="/dev/sndstat"

sed -i "" '/snd/ c\' /boot/loader.conf
(kldload snd_driver) 2>> /dev/null
if [ -e "$SNDSTAT" ] #file exists
then
SNDDRVS=`cat $SNDSTAT| awk '{for(k=1;k<NF;++k){if($k~"snd_") {print $k}}}'`
        #kldunload snd_driver
        if [ -n "$SNDDRVS" ]
        then
               for SNDDRV in $SNDDRVS
                do
                echo "${SNDDRV}_load=\"YES\"" >> /boot/loader.conf
                #kldload ${SNDDRV}
    echo "'${SNDDRV}' detected!"
                done
        fi
        #TODO: add sound system test.
else
        echo "No sound card detected, don't be upset, SILENCE IS GOLDEN!"
fi

uniq ${LOADERCONF} /tmp/tmp 
mv /tmp/tmp ${LOADERCONF}
exit
