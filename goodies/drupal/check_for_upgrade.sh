#/usr/env bash
for module in $(cat contrib.txt); do exists=$(curl -s http://drupal.org/project/$module | grep -e '.*7\.x-\d\.\d.*' | wc -l); if [ $exists -eq 0 ]; then echo $module; fi; done
