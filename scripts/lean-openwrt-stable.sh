#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Add luci-app-ssr-plus
#pushd package/lean
#git clone --depth=1 https://github.com/fw876/helloworld

# Add Project OpenWrt's autocore
#rm -rf autocore
#svn co https://github.com/wwqgtxx-openwrt/project-openwrt/branches/18.06-kernel5.4/package/lean/autocore
#popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/wwqgtxx-openwrt/lienol-package

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-vssr
git clone --depth=1 https://github.com/wwqgtxx-openwrt/lua-maxminddb

# Add mentohust & luci-app-mentohust.
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-mentohust
git clone --depth=1 https://github.com/wwqgtxx-openwrt/MentoHUST-OpenWrt-ipk

# Add ServerChan
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/wwqgtxx-openwrt/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-onliner

# Add luci-app-adguardhome
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-adguardhome

# Add luci-app-diskman
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-dockerman
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-lib-docker

# Add luci-app-gowebdav
git clone --depth=1 https://github.com/wwqgtxx-openwrt/openwrt-gowebdav

# Add luci-app-jd-dailybonus
git clone --depth=1 https://github.com/wwqgtxx-openwrt/node-request
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-jd-dailybonus

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/wwqgtxx-openwrt/luci-theme-argon
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Add tmate
git clone --depth=1 https://github.com/wwqgtxx-openwrt/openwrt-tmate

# Add subconverter
git clone --depth=1 https://github.com/wwqgtxx-openwrt/openwrt-subconverter

# Add gotop
svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ctcgfw/gotop

# Subscribe converters
#svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ctcgfw/subconverter
#svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ctcgfw/jpcre2
#svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ctcgfw/rapidjson
#svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ctcgfw/duktape

# Add smartdns
svn co https://github.com/wwqgtxx-openwrt/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/wwqgtxx-openwrt/project-openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add udptools
git clone --depth=1 https://github.com/wwqgtxx-openwrt/openwrt-udp2raw
git clone --depth=1 https://github.com/wwqgtxx-openwrt/openwrt-udpspeeder
git clone --depth=1 https://github.com/wwqgtxx-openwrt/luci-udptools

# Add OpenAppFilter
git clone --depth=1 https://github.com/wwqgtxx-openwrt/OpenAppFilter
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" zzz-default-settings
sed -i '/http/d' zzz-default-settings
sed -i '/exit/i\chmod +x /bin/ipv6-helper' zzz-default-settings
popd

# Fix libssh
#pushd feeds/packages/libs
#rm -rf libssh
#svn co https://github.com/openwrt/packages/trunk/libs/libssh
#popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/wwqgtxx-openwrt/lienol-package/trunk/net/https-dns-proxy
popd

# Add po2lmo
git clone https://github.com/wwqgtxx-openwrt/po2lmo.git
pushd po2lmo
make && sudo make install
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd