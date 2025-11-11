#!/usr/bin/env sh

# README
# pandoc command required:
# nix-shell -p pandoc

# Input must be a markdown file

FILE=$1 
OPEN_BROWSER=$2

BROWSER_COMMAND="chromium --new-window"
OUTFILE=/tmp/output.html


insert_fixes ()
{
    # add class to body to enable github flavored markdown theme
    sed -i '0,/<body/s//<body class="markdown-body" /' $OUTFILE

    # tweak body class: give it margins
    sed -i '0,/<body/s//<body style="max-width: 700px; margin-left: auto; margin-right: auto; padding: 45px;" /' $OUTFILE

    # insert extra style
    sed -i '/<\/body>/i\
    <style>\
        svg { width: 100%; height: 100%; }\
    </style>' $OUTFILE

    # insert a self reloading script
    #sed -i '/<\/body>/i\
    #<input id="check_reload" type="checkbox" value="true" style="position: fixed;top: 0; right: 0; width: 75px; height: 75px;">\
    #<script>\
        #function reload_loop () {\
            #if (!document.getElementById("check_reload").checked) {\
                #window.location.reload.bind(window.location)();\
                #return;\
            #}\
            #setTimeout(reload_loop, 4000);\
        #}\
        #setTimeout(reload_loop, 4000);\
    #</script>' $OUTFILE

    # insert a reload button
    sed -i '/<\/body>/i\
    <button id="button_reload" style="position: fixed;top: 50%;left: 0;width: 50px;height: 100px;font-size: 2em;">↺</button>\
    <script>\
        let btn = document.getElementById("button_reload")\
            btn.addEventListener("click", () => { window.location.reload.bind(window.location)(); })\
    </script>' $OUTFILE

}


build ()
{
    echo "Rebuilding $FILE output -> $OUTFILE"

    # generate html

    pandoc -c ~/.script/github-markdown.css -f markdown -t html -o $OUTFILE $FILE --resource-path=$(dirname $(realpath $FILE)) --embed-resources --standalone

    # apply fixes

    insert_fixes
}

# build once at the beginning

build

# open browser if requested

if [ "$OPEN_BROWSER" = "open" ]; then
    eval " $BROWSER_COMMAND file://$OUTFILE &"
fi

# listen for modifications

MOD_TIME=$(stat -c %Y $FILE)
while true; do

    CURR_MOD_TIME=$(stat -c %Y $FILE)
    if [ "$CURR_MOD_TIME" != "$MOD_TIME" ]; then
        MOD_TIME=$CURR_MOD_TIME
        build
    fi

    sleep 1
done
