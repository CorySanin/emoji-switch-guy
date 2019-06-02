setEmoji(){
    if [ ! -e $TMPDIR/fonts/$1 ]; then
        abort "! font doesn't exist."
    fi
    mkdir -p $MODPATH/system/fonts
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/NotoColorEmoji.ttf
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/SamsungColorEmoji.ttf
    cp $TMPDIR/fonts/$1 $MODPATH/system/fonts/hTC_ColorEmoji.ttf
    echo $1 >> $MODPATH/font.txt
    ui_print "Installed $1."
}

if [ ! $BOOTMODE ]; then
	abort "! Flash using Magisk manager"
fi

if [ -e $TMPDIR/font.txt ]; then
    setEmoji "$(cat $TMPDIR/font.txt)"
else
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
                setEmoji NotoColorEmoji.ttf
            else
#               ui_print "Would you like to use Microsoft's emojiset?"
#               if $VKSEL; then
#                   setEmoji microsoft.ttf
#               else
                    ui_print "Would you like to use Apple's emojiset?"
                    if $VKSEL; then
                        setEmoji apple.ttf
                    else
                        ui_print "Would you like to use Samsung's emojiset?"
                        if $VKSEL; then
                            setEmoji SamsungColorEmoji.ttf
                        else
                            abort "! no emojiset was chosen."
                        fi
                    fi
#               fi
            fi
        fi
    fi
fi