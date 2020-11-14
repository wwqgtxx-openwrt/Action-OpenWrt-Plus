#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

mkdir -p files/etc/openclash/core

#clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')


#wget -qO- $clash_main_url | tar xOvz > files/etc/openclash/core/clash
#wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
#wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game

clash_main_url=https://github.com/wwqgtxx/clashr/releases/download/v1.2.0.1/clashr-linux-amd64-v1.2.0.1.gz
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=https://github.com/wwqgtxx/clashr/releases/download/v1.1.0.1-tun/clashr-linux-amd64-v1.1.0.1-tun.gz

wget -qO- $clash_main_url | gunzip -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | gunzip -c > files/etc/openclash/core/clash_game

chmod +x files/etc/openclash/core/clash*