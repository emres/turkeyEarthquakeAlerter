# Turkey Earthquake Alerter

A minimalist earthquake alerter for Turkey.

## Usage

    ./earthquakeAlert.sh <magnitude_threshold>
    
Example

    ./earthquakeAlert.sh 4.0
    
will retrieve data from [Kandilli
Observatory](http://www.koeri.boun.edu.tr/eew/index.htm) and will print a
warning window if there's been an earthquake whose magnitude is greater than
*4.0*. If the user clicks OK, she will be taken to the Kandilli Observatory's
relevant web page for more details and maps.

## Dependencies

The major dependency is [XMLStarlet](http://xmlstar.sourceforge.net/), a command
line utility to process XML data.
