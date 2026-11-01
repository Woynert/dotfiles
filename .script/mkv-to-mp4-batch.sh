#!/usr/bin/env bash

# * Converts mkv to mp4 while keeping all audio tracks. (Default ffmpeg command discards extra tracks).
# * Deletes mkv.

for file in *.mkv; do
    if ffmpeg -i "$file" -map 0:v -c:v libx264 -crf 23 -map 0:a -c:a aac -b:a 128k "${file%.mkv}.mp4"; then
        rm "$file"
        echo "Done: $file"
    else
        echo "Failure: Keeping $file."
    fi
done

# -map 0:v     - Add video.
# -c:v libx264 - Video codec.
# -crf 23      - Video quality. Lower numbers mean higher quality and larger files. 23 is default.
# -map 0:a     - Add all audio tracks.
# -c:a aac     - Audio codec.
# -b:a 128k    - Audio bitrate.
