#!/bin/bash
#=================================================
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================
now_dir=$(pwd)
clone_dir=${now_dir}"/../git_clone_temporary_space"
if [ ! -d "$clone_dir" ]; then
  mkdir "$clone_dir"
fi
function github_partial_clone(){
    url_prefix="https://github.com/" author_name="$1" repository_name="$2" branch_name="$3" required_dir="$4" saved_dir="$5"
    if [ "$branch_name" == "use_default_branch" ]; then
        branch_option=""
    else        
        branch_option="-b "${branch_name}
    fi
    if [ ! -d ${saved_dir} ]; then
        mkdir -vp ${saved_dir}
    fi
    if [ ! -d ${clone_dir}"/"${repository_name} ]; then
        git clone --depth=1 ${branch_option} ${url_prefix}${author_name}"/"${repository_name}".git" ${clone_dir}"/"${repository_name}
    fi
    mv ${clone_dir}"/"${repository_name}"/"${required_dir}/* ${saved_dir}
    rm -rf ${clone_dir}"/"${repository_name}
}

rm -rf package/base-files/files/lib/preinit/80_mount_root
wget -P package/base-files/files/lib/preinit https://raw.githubusercontent.com/DHDAXCW/lede-rockchip/stable/package/base-files/files/lib/preinit/80_mount_root 
# rm -rf package/libs/libnl-tiny
# rm -rf package/kernel/mac80211
# rm -rf package/kernel/mt76
# rm -rf package/network/services/hostapd
# rm -rf package/wwan
# github_partial_clone DHDAXCW lede-rockchip use_default_branch package/wwan package/wwan
# github_partial_clone openwrt openwrt use_default_branch package/libs/libnl-tiny package/libs/libnl-tiny
# github_partial_clone openwrt openwrt use_default_branch package/kernel/mac80211 package/kernel/mac80211
# github_partial_clone DHDAXCW lede-rockchip use_default_branch package/kernel/mt76 package/kernel/mt76
# github_partial_clone openwrt openwrt use_default_branch package/network/services/hostapd package/network/services/hostapd

# alist
git clone https://github.com/sbwml/luci-app-alist package/alist
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add luci-app-watchcat-plus
git clone https://github.com/gngpp/luci-app-watchcat-plus.git

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../../customfeeds/luci/applications/luci-app-kodexplorer
rm -rf ../../customfeeds/luci/applications/luci-app-socat
rm -rf ../../customfeeds/luci/applications/luci-app-ipsec-server
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

rm -rf ../../customfeeds/packages/net/adguardhome

# Add luci-app-irqbalance by QiuSimons https://github.com/QiuSimons/OpenWrt-Add
github_partial_clone QiuSimons OpenWrt-Add use_default_branch luci-app-irqbalance luci-app-irqbalance

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages

# Add luci-app-netdata
rm -rf ../../customfeeds/luci/applications/luci-app-netdata
git clone --depth=1 https://github.com/sirpdboy/luci-app-netdata

# Add luci-app-partexp
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp

# Add luci-app-netspeedtest
git clone --depth=1 https://github.com/sirpdboy/NetSpeedTest

# Add luci-app-autotimeset
git clone --depth=1 https://github.com/sirpdboy/luci-app-autotimeset
sed -i "s/\"control\"/\"system\"/g" luci-app-autotimeset/luasrc/controller/autotimeset.lua

# Add mosdns
rm -rf ../../customfeeds/packages/net/mosdns
rm -rf ../../customfeeds/packages/utils/v2dat
rm -rf ../../customfeeds/applications/luci-app-mosdns
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns

# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld

# add luci-app-daed
git clone https://github.com/sbwml/luci-app-daed-next

# Add luci-app-unblockneteasemusic
rm -rf ../../customfeeds/luci/applications/luci-app-unblockmusic
git clone --branch master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/MilesPoupart/luci-app-vssr

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add OpenClash
github_partial_clone vernesong OpenClash use_default_branch luci-app-openclash luci-app-openclash

# Add ddnsto & linkease
github_partial_clone linkease nas-packages-luci use_default_branch luci/luci-app-ddnsto luci-app-ddnsto
github_partial_clone linkease nas-packages use_default_branch network/services/ddnsto ddnsto

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add ServerChan
rm -rf ../../customfeeds/luci/applications/luci-app-serverchan
git clone -b openwrt-18.06 --depth=1 https://github.com/tty228/luci-app-wechatpush.git

# Add luci-app-dockerman
rm -rf ../../customfeeds/luci/collections/luci-lib-docker
rm -rf ../../customfeeds/luci/applications/luci-app-docker
rm -rf ../../customfeeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../../customfeeds/luci/themes/luci-theme-argon
rm -rf ../../customfeeds/luci/themes/luci-theme-argon-mod
rm -rf ./luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/data/bg1.jpg luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
git clone https://github.com/DHDAXCW/theme
rm -rf ../../customfeeds/luci/themes/luci-theme-design
rm -rf ../../customfeeds/luci/applications/luci-app-design-config
git clone --depth=1 https://github.com/gngpp/luci-app-design-config
git clone --depth=1 https://github.com/gngpp/luci-theme-design

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-app-smartdns & smartdns
rm -rf ../../customfeeds/luci/applications/luci-app-smartdns
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns

# Add luci-app-wolplus
github_partial_clone sundaqiang openwrt-packages use_default_branch luci-app-wolplus luci-app-wolplus

# Add apk (Apk Packages Manager)
rm -rf ../../customfeeds/packages/utils/apk
github_partial_clone openwrt packages use_default_branch utils/apk apk

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-aliyundrive-webdav
rm -rf ../../customfeeds/luci/applications/luci-app-aliyundrive-webdav
rm -rf ../../customfeeds/packages/multimedia/aliyundrive-webdav
github_partial_clone messense aliyundrive-webdav use_default_branch openwrt/aliyundrive-webdav aliyundrive-webdav
github_partial_clone messense aliyundrive-webdav use_default_branch openwrt/luci-app-aliyundrive-webdav luci-app-aliyundrive-webdav
popd

# Add Pandownload
pushd package/lean
github_partial_clone immortalwrt packages use_default_branch net/pandownload-fake-server pandownload-fake-server
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
