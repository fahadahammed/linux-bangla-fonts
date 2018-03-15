#!/bin/bash
#-------------------------------
#
# Archieve Creator
#
#	Created By Fahad Ahammed
#
#	Get me by email@fahadahammed.com or obak.krondon@gmail.com if you want to ...
#-------------------------------


archieveFolder="archieve"
fontsFolder="fonts"
archieveName="lsaBanglaFonts.tar.gz"


if [ -e "$archieveFolder/$archieveName" ]; then
    echo "File exists";
    rm $archieveFolder/$archieveName;
    cd $fontsFolder; tar -zcvf lsaBanglaFonts.tar.gz *;mv $archieveName ../$archieveFolder/;
else
    echo "File does not exist";
    cd $fontsFolder; tar -zcvf lsaBanglaFonts.tar.gz *;mv $archieveName ../$archieveFolder/;
fi 
