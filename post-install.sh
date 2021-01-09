echo 'Setting up to GMT-3'
sudo timedatectl set-timezone America/Sao_Paulo
echo 'Spinning up all necessary data to start!'

echo 'Remember to always run as sudo'
sleep 1
echo 'This script is mostly compatible with ubuntu 20.04. Please check for updates if newer versions.'
echo 'Updating and installing dependencies'

sudo apt-get update
sudo apt-get install curl wget screen -y

echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
sleep 2

echo 'Refreshing profiles...'
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh
echo 'Installing latest node version (14.15.4)'
nvm install 14.15.4
sleep 1
echo 'Installing forever - node will keep always running, except when dont'
npm install forever -g
sleep 2
echo 'Installing WO'
wget -qO wo wops.cc && sudo bash wo
echo 'Everything done right for the binary. Installing stack for php + nginx + mariadb + redis'
sleep 1

wo stack install --fail2ban --web --phpmyadmin --redis --composer
echo 'Great. Installing autocompletion.'
source /etc/bash_completion.d/wo_auto.rc

echo 'Ending gracefully'
