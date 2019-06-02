setEmoji(){
    mkdir $MODPATH
    mkdir $MODPATH/system
    mkdir $MODPATH/system/fonts
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/NotoColorEmoji.ttf
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/SamsungColorEmoji.ttf
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/hTC_ColorEmoji.ttf
    ui_print "Installed $1."
}

if [ ! $BOOTMODE ]; then
	abort "! Flash using Magisk manager"
fi


ui_print "~~ For this install, vol up is yes and vol down is no. ~~"

ui_print "Would you like to use Twemoji?"
if $VKSEL; then
    setEmoji twitter.ttf
else
    ui_print "Would you like to use JoyPixels?"
    if $VKSEL; then
        setEmoji joypixels-android.ttf
    else
        ui_print "Would you like to use Google's emojiset?"
        if $VKSEL; then
            setEmoji google.ttf
        else
#            ui_print "Would you like to use Microsoft's emojiset?"
#            if $VKSEL; then
#                ui_print "TODO: Install Microsoft's emojiset"
#            else
#                ui_print "Would you like to use Apple's emojiset?"
#                if $VKSEL; then
#                    ui_print "TODO: Install Apple's emojiset"
#                else
                    ui_print "Would you like to use Samsung's garbage emojiset?"
                    if $VKSEL; then
                        setEmoji SamsungColorEmoji.ttf
                    else
                        abort "! no emojiset was chosen."
                    fi
#                fi
#            fi
        fi
    fi
fi