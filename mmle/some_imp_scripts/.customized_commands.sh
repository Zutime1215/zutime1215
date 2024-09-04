#!/bin/bash

# print all customized commands
function cmds() {
  help="### Customised Commands ###
pyhttp - For http server
mnt - For mount drive
playlist - For making a .m3u Playlist
"
  echo "$help"
}

# PlayList maker
function playlist() {
  video_ext=(".mkv" ".mp4" ".MKV" ".MP4" ".m4v" ".M4V")
  touch playLisT.m3u
  for ext in "${video_ext[@]}"; do
    for file in ./*"$ext"; do
      if [ -e "$file" ]; then
         echo "$file" >> playLisT.m3u
      fi
    done
  done
}


# python http-server server
function pyhttp() {
  ifconfig
  python3 -m http.server $1 
}

# mount drive
function mnt() {
  sudo mount /dev/$1 /media/sirens/
}

# i2p commands
function i2p() {
  /home/sirens/software/i2p/i2prouter $1
}

# python execute easy
function py() {
  python3 $1 $2 $3 $4 $5
}

# made my life easy
function mmle() {
  # Creating and copying important files and folder
  mkdir mmle
  cd mmle
  mkdir sublime_settings
  cp -rf /home/$(whoami)/.config/sublime-text/Packages/User/* ./sublime_settings/
  cp -rf /home/$(whoami)/Documents/some_imp_codes ./
  mkdir some_imp_scripts
  cp -rf /home/$(whoami)/.customized_commands.sh ./some_imp_scripts/

  # Uploading Part
  cd ..
  git add .
  commit_msg=$(whoami)"-"$(date)
  git commit -m "i am $commit_msg"
  git push -u origin main
  echo -e "\e[31m\e[1m\e[5mUploaded Boss!!!"
}

function test() {
  cd /home/$(whoami)
}