#!/bin/bash
#=================================================
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# alist
git clone https://github.com/sbwml/luci-app-alist package/alist
rm -rf feeds/packages/lang/golang
svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../../customfeeds/luci/applications/luci-app-kodexplorer
rm -rf ../../customfeeds/luci/applications/luci-app-socat
rm -rf ../../customfeeds/luci/applications/luci-app-ipsec-server
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

# Add luci-app-irqbalance by QiuSimons https://github.com/QiuSimons/OpenWrt-Add
svn export https://github.com/QiuSimons/OpenWrt-Add/trunk/luci-app-irqbalance

# Add luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall
cd openwrt-passwall
git checkout 4fd4bf8
cd ../
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall

# Add luci-app-netdata
rm -rf ../../customfeeds/luci/applications/luci-app-netdata
git clone -b patch-1 --depth=1 https://github.com/MilesPoupart/luci-app-netdata

# Add luci-app-partexp
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp

# Add luci-app-netspeedtest
git clone --depth=1 https://github.com/sirpdboy/NetSpeedTest

# Add luci-app-autotimeset
git clone --depth=1 https://github.com/sirpdboy/luci-app-autotimeset

# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld

# Add luci-app-unblockneteasemusic
rm -rf ../../customfeeds/luci/applications/luci-app-unblockmusic
git clone --branch master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash

# Add ddnsto & linkease
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto
svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add luci-app-dockerman
rm -rf ../../customfeeds/luci/collections/luci-lib-docker
rm -rf ../../customfeeds/luci/applications/luci-app-docker
rm -rf ../../customfeeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme
git clone https://github.com/DHDAXCW/theme
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-app-smartdns & smartdns
svn export https://github.com/281677160/openwrt-package/trunk/luci-app-smartdns

# Add luci-app-wolplus
svn export https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus

# Add apk (Apk Packages Manager)
svn export https://github.com/openwrt/packages/trunk/utils/apk

# Add luci-udptools
svn export https://github.com/zcy85611/Packages/trunk/luci-udptools
svn export https://github.com/zcy85611/Packages/trunk/udp2raw
svn export https://github.com/zcy85611/Packages/trunk/udpspeeder

# Add extra wireless drivers
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff

# Add OpenAppFilter
git clone --depth=1 https://github.com/DHDAXCW/OpenAppFilter

# Add luci-aliyundrive-webdav
rm -rf ../../customfeeds/luci/applications/luci-app-aliyundrive-webdav 
rm -rf ../../customfeeds/packages/multimedia/aliyundrive-webdav
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav
popd

# Add Pandownload
pushd package/lean
svn export https://github.com/immortalwrt/packages/trunk/net/pandownload-fake-server
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/18.06/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# sed -i 's/5.15/5.10/g' target/linux/rockchip/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='HarmonyWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /MilesPoupart @ HarmonyWrt /g" package/lean/default-settings/files/zzz-default-settings

rm package/base-files/files/etc/banner
touch package/base-files/files/etc/banner
echo -e "____________________________________________________________________" >> package/base-files/files/etc/banner
echo -e "    _     _                                      _      _           " >> package/base-files/files/etc/banner
echo -e "    /    /                                       |  |  /            " >> package/base-files/files/etc/banner
echo -e "---/___ /-----__---)__---_--_----__----__--------|-/|-/----)__--_/_-" >> package/base-files/files/etc/banner
echo -e "  /    /    /   ) /   ) / /  ) /   ) /   ) /   / |/ |/    /   ) /   " >> package/base-files/files/etc/banner
echo -e "_/____/____(___(_/_____/_/__/_(___/_/___/_(___/__/__|____/_____(_ __" >> package/base-files/files/etc/banner
echo -e "                                             /                      " >> package/base-files/files/etc/banner
echo -e "                                         (_ /                       " >> package/base-files/files/etc/banner
echo -e "--------------------------------------------------------------------" >> package/base-files/files/etc/banner
echo -e "           MilesPoupart's HarmonyWrt built on "$(date +%Y.%m.%d)"\n____________________________________________________________________" >> package/base-files/files/etc/banner

# 风扇脚本
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/init.d/fa-rk3328-pwmfan
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/usr/bin/start-rk3328-pwm-fan.sh
wget -P target/linux/rockchip/armv8/base-files/etc/rc.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/rc.d/S96fa-rk3328-pwmfan
chmod +x target/linux/rockchip/armv8/base-files/etc/init.d/fa-rk3328-pwmfan
chmod +x target/linux/rockchip/armv8/base-files/usr/bin/start-rk3328-pwm-fan.sh
