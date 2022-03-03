## 基于DHDAXCW骷髅头的R2S固件（Docker版本）进行修改

Github Action终于不堪全插件版本的重负，大概率无法在线编译了。全插件版本将在必要时手动编译可用版本。

自动编译每周三、周六编译**Docker精简版**。<br>
每天编译**Docker全插件版**（大概率不成功）。<br>
手动触发编译的**Docker精简版**、**Docker全插件版**将在有重要更新内容后更新。

# 目前主要改动如下

## 插件相关

1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）
3. 恢复加入Watchcat（luci-app-watchcat）
4. 加入iperf3
5. 由于编译问题，暂时移除了rtl8812au-ac驱动
6. 继承Docker版全插件衣钵 继续编译全插件版本(不保证成功)
7. 精简Docker版除以上区别外，基本与骷髅头的精简Docker版看齐，其他差别为：
    + 进一步去除baidupcs-web、tencentddns、unblockneteasemusic、uugamebooster、mentohust；
    + 恢复保留kodexplorer、minidlna、pptp-server、socat、verysync、webadmin、xlnetacc、ipv6等相关协议支持。

## 驱动相关

8. 由于lean的lede项目中加入了rtl8821cu的驱动，移除lean.sh中的svn语句

## 编译相关

9. 不生成rootfs格式的固件（全插件版本仅生成EXT4版本固件）
10. 修改config中的相关表述，加入CONFIG_EXPERIMENTAL、CONFIG_HAS_TESTING_KERNEL两个实验性选项

## 发布相关
11. docker精简版即日起不再发布packages-server.zip、config.buildinfo、.manifest文件，需要相关插件安装包的可在最近一次全插件版本的发布中下载。