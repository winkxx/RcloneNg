#!/bin/bash
#!！
#！
mkdir /root/.config/
mkdir /root/.config/rclone
touch /root/.config/rclone/rclone.conf
echo "$conf" >>/root/.config/rclone/rclone.conf


nohup filebrowser -r /  -p 9184 >> /dev/null 2>&1 &


git clone https://github.com/winkxx/RcloneNg.git
chmod 0777 /RcloneNg
cp /RcloneNg/nginx.conf /etc/nginx/


nginx -c /etc/nginx/nginx.conf
nginx -s reload

nohup rclone rcd --rc-addr=127.0.0.1:5572 --rc-user=xxr --rc-pass=991211 --rc-allow-origin="https://elonh.github.io" &

