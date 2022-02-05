#!/bin/bash
#!！
#！
mkdir /root/.config/
mkdir /root/.config/rclone
touch /root/.config/rclone/rclone.conf
echo "$conf" >>/root/.config/rclone/rclone.conf
nginx -c /etc/nginx/nginx.conf
nginx -s reload
rclone rcd --rc-user=xxr --rc-pass=991211 --rc-allow-origin="http://localhost:4200"
git clone https://github.com/ElonH/RcloneNg.git
cd RcloneNg
npm install # NodeJs version >= 10
npm run start
