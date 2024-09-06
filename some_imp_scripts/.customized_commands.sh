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

function shoot() {
  sudo shutdown -P now
}

# made my life easy
function mmle() {
  # Creating and copying important files and folder
  cd /home/$(whoami)/Public/BackToTheGithub
  mkdir $(date +%Y-%m-%d_%H:%M:%S)
  cp -rf Zutime1215/.git ./$(date +%Y-%m-%d_%H)*
  cp -rf Zutime1215/README.md ./$(date +%Y-%m-%d_%H)*
  cd $(date +%Y-%m-%d_%H)*

  mkdir sublime_settings
  cp -rf /home/$(whoami)/.config/sublime-text/Packages/User/git* ./sublime_settings/
  cp -rf /home/$(whoami)/.config/sublime-text/Packages/User/Package\ Control.sublime-settings ./sublime_settings/
  cp -rf /home/$(whoami)/Documents/some_imp_codes ./
  mkdir some_imp_scripts
  cp -rf /home/$(whoami)/.customized_commands.sh ./some_imp_scripts/

  # Uploading Part
  git add .
  git commit -m "i am $(whoami)"-"$(date)"
  git push -u origin main

  cd ..
  rm -rf Zutime1215
  mv $(date +%Y-%m-%d_%H)* Zutime1215
  echo -e "\e[31m\e[1m\e[5mUploaded Boss!!!"
}

function test() {
  echo Test Complete
}