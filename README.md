# Turkey Earthquake Alerter

A minimalist earthquake alerter for Turkey.

## Usage

    ./earthquakeAlert.sh <magnitude_threshold>
    
Example

    ./earthquakeAlert.sh 4.0
    
will retrieve data from [Kandilli
Observatory](http://www.koeri.boun.edu.tr/eew/index.htm) and print a
warning window if there's been an earthquake whose magnitude is greater than
*4.0*. If the user clicks OK, she will be taken to the Kandilli Observatory's
relevant web page for more details and maps.

## Screenshot

![Screenshot](./img/screenshot01.png "Screenshot")


## Dependencies

The major dependency is [XMLStarlet](http://xmlstar.sourceforge.net/), a command
line utility to process XML data.

## Disclaimer

I'm neither a geologist, nor a geophysicist. This program is not intended for
accurate, scientific use. Moreover, this program is **not** an early warning
system. Use at your own risk.
