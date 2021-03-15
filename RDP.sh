{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww28600\viewh15280\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
#! /bin/bash\
printf "Installing RDP Be Patience... " >&2\
\{\
sudo useradd -m ALOK\
sudo adduser ALOK sudo\
echo 'ALOK:8426' | sudo chpasswd\
sed -i 's/\\/bin\\/sh/\\/bin\\/bash/g' /etc/passwd\
sudo apt-get update\
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb\
sudo dpkg --install chrome-remote-desktop_current_amd64.deb\
sudo apt install --assume-yes --fix-broken\
sudo DEBIAN_FRONTEND=noninteractive \\\
apt install --assume-yes xfce4 desktop-base\
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  \
sudo apt install --assume-yes xscreensaver\
sudo systemctl disable lightdm.service\
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb\
sudo dpkg --install google-chrome-stable_current_amd64.deb\
sudo apt install --assume-yes --fix-broken\
sudo apt install nautilus nano -y \
sudo adduser ALOK chrome-remote-desktop\
\} &> /dev/null &&\
printf "\\nSetup Complete " >&2 ||\
printf "\\nError Occured " >&2\
printf '\\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\\n'\
read -p "Paste Here: " CRP\
su - ALOK -c """$CRP"""\
printf 'Check https://remotedesktop.google.com/access/ \\n\\n'\
if sudo apt-get upgrade &> /dev/null\
then\
    printf "\\n\\nUpgrade Completed " >&2\
else\
    printf "\\n\\nError Occured " >&2\
fi}