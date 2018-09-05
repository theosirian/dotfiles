#! /usr/bin/env bash
echo "==== INSTALL BASIC APT STUFF"
sudo apt install apt-transport-https curl ca-certificates software-properties-common

echo "==== ADD REPOSITORIES"
sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "==== APT UPDATE"
sudo apt update

echo "==== INSTALL STUFF WITH APT"
sudo apt install git \
  docker-ce \
  awesome \
  tmux \
  mpv \
  mpd \
  mpc \
  htop \
  firefox \
  redshift \
  goldendict \
  goldendict-wordnet \
  anki \
  rxvt-unicode \
  pwgen \
  pass \
  binutils \
  make \
  pkg-config \
  autoconf \
  automake \
  libtool \
  cmake \
  mono-devel \
  mono-complete \
  xsel \
  youtube-dl \
  pavucontrol \
  python3 \
  python3-pip \
  iotop \
  net-tools \
  bmon \
  feh \
  bash-completion \
  build-essential \
  powertop \
  tlp \
  tp-smapi-dkms \
  dmenu \
  zsh \
  irssi \
  tox \
  vim \
  snap
  
echo "==== INSTALL RTV"
pip install rtv

echo "==== INSTALL SPOTIFY"
snap install spotify

#echo "==== INSTALL NERF FONT IOSEVKA"
#git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
#./nerd-fonts/install.sh Iosevka

echo "==== INSTALL OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "==== INSTALL NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo "==== INSTALL QUTEBROWSER"
git clone https://github.com/qutebrowser/qutebrowser.git
cd qutebrowser
tox -e mkvenv-pypi

sudo cat <<EOF > /usr/local/bin/qutebrowser
#! /usr/bin/env bash
\$HOME/qutebrowser/.venv/bin/python3 -m qutebrowser "\$@"
EOF

echo "==== CHANGE SHELL TO ZSH"
chsh -s /bin/zsh
