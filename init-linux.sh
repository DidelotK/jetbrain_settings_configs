#!/usr/bin/env bash

# Création des dossiers importants
cd ~/
mkdir Softwares Scripts Workspace

# Mise à jour des paquets apt
sudo apt-get update && sudo apt-get upgrade -y

# Installation + passage en zsh
sudo apt-get install -y zsh
zsh

# Installation des paquets nécessaires au futur installations
sudo apt-get install -y curl git

# Installation de oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installation de la coloration synthaxique
cd ~/Softwares
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Ajout de mes petits alias 
echo '                                                                                                                                        
alias emacs="emacs -nw"
alias O="nautilus ."
alias C="clear"                                                                                                                               
alias ni="npm install"                                                     
alias ns="npm start"                                                                                                                          
alias nis="npm install && npm start"                                                                                                          
' >> ${ZDOTDIR:-$HOME}/.zshrc

# Ajout du lancement automatique de la coloration synthaxique lors du lancement du terminal
echo 'source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc

#Installation de fasd
cd ~/Softwares
git clone https://github.com/clvv/fasd.git
cd ~/Softwares/fasd
sudo make install

# Ajout du lancement automatique de fasd lors du lancement du terminal
echo 'eval "$(fasd --init auto)"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Installation des paquets nécessaires pour travailler
sudo apt-get install -y emacs terminator tree vagrant ansible

# Téléchargement de la toolbox jetbrains
cd ~/Softwares
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.4.2492.tar.gz
tar -zxvf jetbrains-toolbox-1.4.2492.tar.gz

# Installation de node + npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# Installation de nvm (node version manager)
sudo npm i -g npm
sudo npm i -g nvm

#Installation de docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce -y

#Installation de docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
