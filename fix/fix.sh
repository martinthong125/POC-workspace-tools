#!/bin/bash

# this script should be run only when the evilfile is present, which indicate it is vulnerable. After running the script, the evilfile should not be created. This will indicate a successful patch.
# delete evilfile
echo "deleting evilfile and replacing git.js and running node poc.js"
rm ~/javascript/poc/evilfile

# replace lines in git.js
cd ~/javascript/node_modules/workspace-tools/lib
# sed -i 's/search_string/replace_string/' filename
# fix both lines of code
sed -i 's/git(\[\"fetch\",\ remote/git(\[\"fetch\",\ \"--\",\ remote/g' git.js

# replace vulnerable file
# cp git.js ~/javascript/node_modules/workspace-tools/lib

# run poc again
cd ~/javascript/poc
node poc.js