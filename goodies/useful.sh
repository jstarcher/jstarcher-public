############
##  sed   ##
############

## Find and Replace
find -name '*.inc' -exec sed -i s/old/new/g {} \;
find -name '*.inc' -exec sed -i s'#libraries/datatables#libraries/datatables-1.8.1#'g {} \;

## Delete
# Deletes any line with //error_log
find -name '*.php' -exec sed -i '/\/\/error_log/'d {} \;

#############
##   SVN   ##
#############

## Restore deleted revision (Ex: 1234)
svn export http://example.com/svn/repo@1234
