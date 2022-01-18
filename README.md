## 基于DHDAXCW骷髅头的R2S固件（Docker版本）进行修改

Github Action终于不堪全插件版本的重负，无法在线编译了。全插件版本将在必要时手动编译。

自动编译每周三编译**Docker精简版**。<br>
手动触发编译的**Docker精简版**、**Docker全插件版**将在有重要更新内容后更新。

# 目前主要改动如下

## 插件相关

1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）Watchcat（luci-app-watchcat）
3. 加入autotimeset
4. 加入iperf3
5. 继承Docker版全插件衣钵 继续编译全插件版本(不定期)
6. 精简Docker版除以上区别外，基本与骷髅头的精简Docker版看齐，其他差别为：
    + 进一步去除aliyundrive-webdav、baidupcs-web、tencentddns、unblockneteasemusic、uugamebooster；
    + 恢复保留airplay2、ipsec-server、jd-dailybonus、kodexplorer、minidlna、pptp-server、shairplay、socat、verysync、watchcat、webadmin、xlnetacc、udptools、ipv6等相关协议支持、mentohust。

## 驱动相关

7. 由于lean的lede项目中加入了rtl8821cu的驱动，移除lean.sh中的svn语句

## 编译相关

8. 不生成rootfs格式的固件
9. 加入编译优化选项CONFIG_TARGET_OPTIMIZATION="-O3 -pipe -march=armv8-a+crypto+crc -mcpu=cortex-a53+crypto+crc -mtune=cortex-a53"（虽然modify_config.sh好像已经做了这件事...）
10. 修改beta_docker.config中的相关表述，加入CONFIG_EXPERIMENTAL、CONFIG_HAS_TESTING_KERNEL两个实验性选项
