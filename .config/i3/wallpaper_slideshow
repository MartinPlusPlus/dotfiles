#!/bin/sh

sleep_minutes=15

function cycle_pictures() {
    for FILE in ~/Pictures/Wallpaper/.feh_slideshow/*; 
    do 
        feh --bg-scale $FILE
        sleep $(( 60 * $sleep_minutes )) 
    done
    cycle_pictures
}

cycle_pictures
