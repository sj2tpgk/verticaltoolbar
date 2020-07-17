#!/bin/sh

zip_contents=(LICENSE.txt README.org chrome/ chrome.manifest defaults/ icon.png icon64.png install.rdf)

basename=$(cat install.rdf | perl -ne 'if(s/\s*<em:id>(.*)<.*/\1/){print;exit}')
version=$(cat install.rdf | perl -ne 'if(s/\s*<em:version>(.*)<.*/\1/){print;exit}')
xpi="${basename/@*/}-$version@${basename/*@/}.xpi"

[ -f "$xpi" ] && rm "$xpi"
zip "$xpi" -qr "${zip_contents[@]}"
