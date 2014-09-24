for i in `find . -name '*.*' -type f \( -iname "*.class" -or -iname "*.php" \)`
 do
   j=`echo $i | sed 's/old/new/g'`
   mv "$i" "$j"
 done
