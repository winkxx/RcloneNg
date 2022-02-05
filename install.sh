#wget https://nodejs.org/dist/v16.13.2/node-v16.13.2-linux-x64.tar.xz
#tar -xvf node-v16.13.2-linux-x64.tar.xz
#sudo mv node-v16.13.2-linux-x64 /usr/local/node
#cd usr/bin
#sudo ln -s /usr/local/node/bin/node node
#sudo ln -s /usr/local/node/bin/npm npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
cd ~/
bash <(curl -sL install.emengweb.com/fclone.sh)
mv /usr/bin/fclone /usr/bin/rclone
chmod 777 /usr/bin/rclone
rclone rcd --rc-user=xxr --rc-pass=991211 --rc-allow-origin="http://localhost:4200"
