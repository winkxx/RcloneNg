#!/bin/bash
#!！
mkdir /root/.config/
mkdir /root/.config/rclone
touch /root/.config/rclone/rclone.conf
echo "$conf" >>/root/.config/rclone/rclone.conf
git clone https://github.com/ElonH/RcloneNg.git
cd RcloneNg
npm install # NodeJs version >= 10
npm run start
