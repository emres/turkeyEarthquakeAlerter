#!/usr/bin/env bash

################################################################################
# Ask to open a browser to Kandilli observatory
# if there's a recent earthquate with a magnitude bigger
# than the given parameter.
################################################################################

set -e
set -u
set -o pipefail

THRESHOLD=$1
TMP_DIR=$(mktemp -d)

AWK_COMMAND="BEGIN { FS = \",\" } ; {if(\$3 >= $THRESHOLD) print \$1\",\", \$2\",\", \$3}"

curl -s http://udim.koeri.boun.edu.tr/zeqmap/xmlt/son24saat.xml > $TMP_DIR/24.xml

paste -d, <(xmlstarlet select -t -v "eqlist/earhquake/@name" $TMP_DIR/24.xml) \
          <(xmlstarlet select -t -v "eqlist/earhquake/@lokasyon" $TMP_DIR/24.xml) \
          <(xmlstarlet select -t -v "eqlist/earhquake/@mag" $TMP_DIR/24.xml) \
    | tac \
    | awk "$AWK_COMMAND" \
    > $TMP_DIR/magnitudes_over_threshold.txt

EARTHQUAKE=$(sort -b -r -t, -k3 $TMP_DIR/big_magnitudes.txt | head -n1)

if [ -s $TMP_DIR/magnitudes_over_threshold.txt ]; then
    BUTTON=$(xmessage -buttons Ok:0,Cancel:2 -default Ok \
              "$EARTHQUAKE ==> Visit web page?" \
              -print \
              -center)
   
   if [[ $BUTTON == "Ok" ]]; then
       x-www-browser http://udim.koeri.boun.edu.tr/zeqmap/gmapt.asp
   fi
fi
