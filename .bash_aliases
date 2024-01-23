#  _               _            _ _
# | |__   __ _ ___| |__    __ _| |_  __ _ ___  ___  ___
# | "_ \ / _` / __| "_ \  / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | || (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_| \__,_|_|_|\__,_|___/\___||___/
#                     ______
#                    |______|

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

alias vi="nvim"

alias s="$HOME/.config/my-bash-jazz/bin/my-ssh"
alias s-copy="$HOME/.config/my-bash-jazz/bin/my-ssh default copy"

alias a="tmux attach -d"
alias n="$HOME/.config/my-bash-jazz/bin/my-tmux-session"
alias N="$HOME/.config/my-script/bin/my-tmux-windowizer"

alias t="$HOME/.config/my-bash-jazz/bin/my-tmux-session"

alias i="viu"
alias m="termusic"
alias m-d-y="yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail"
alias m-d-y-m4a="yt-dlp -x -f bestaudio[ext=m4a] --add-metadata"

alias unzip-tar="tar -zxvf "

alias pass-work='PASSWORD_STORE_DIR=~/.password-store-work pass'

alias capslock="xdotool key Caps_Lock"

alias dc="docker-compose"
alias dcup="docker-compose up -d"
alias dcdown="docker-compose down"
alias dcdownup="docker-compose down && docker-compose up -d"
alias dcstop="docker-compose stop"
alias dcstart="docker-compose start"
alias dcrestart="docker-compose restart"
alias dcli="docker-compose exec cli bash"

alias php-xdebug="XDEBUG_MODE=debug XDEBUG_SESSION=1"
