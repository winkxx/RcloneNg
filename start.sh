#!/bin/bash
#!！
#！
mkdir /root/.config/
mkdir /root/.config/rclone
touch /root/.config/rclone/rclone.conf
echo "$conf" >>/root/.config/rclone/rclone.conf
nohup filebrowser -r /  -p 9184 >> /dev/null 2>&1 &
nohup rclone rcd --rc-addr=127.0.0.1:5572 --rc-user=xxr --rc-pass=991211 --rc-allow-origin="https://elonh.github.io" &
nginx -c /etc/nginx/nginx.conf
nginx -s reload
#git clone https://github.com/ElonH/RcloneNg.git
#cd RcloneNg
#npm install # NodeJs version >= 10
#npm run start
