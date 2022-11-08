## 基于DHDAXCW骷髅头的R2S固件（Docker版本）进行修改

<img src="https://img.shields.io/github/downloads/MilesPoupart/NanoPi-R2S/total.svg?style=for-the-badge&color=32C955"/>


由于免费的Github-hosted runners磁盘空间由100GB大幅缩水到[14GB](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources)，
**在线编译已不可行**。将在一个月内全面切换到自托管设备编译，固件更新将在上游更新后进行。

**后台地址仍为192.168.2.1！！！**

# 目前主要改动如下

## 插件相关

1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）
3. 恢复加入Watchcat（luci-app-watchcat）
4. 加入iperf3
5. 继承Docker版全插件衣钵 继续编译全插件版本(不保证成功)
6. 精简Docker版除以上区别外，基本与骷髅头的精简Docker版看齐，其他差别为：
    + 进一步去除baidupcs-web、tencentddns、unblockneteasemusic、uugamebooster、mentohust；
    + 恢复保留kodexplorer、minidlna、pptp-server、socat、verysync、webadmin、xlnetacc、ipv6等相关协议支持。

## 驱动相关

7. 由于lean的lede项目中加入了rtl8821cu的驱动，移除lean.sh中的svn语句

## 编译相关

8. 由于仅发布docker版本，不生成rootfs格式、SQUASHFS格式的固件，仅生成ext4固件。
9. 修改config中的相关表述，加入CONFIG_EXPERIMENTAL、CONFIG_HAS_TESTING_KERNEL、CONFIG_TESTING_KERNEL等实验性选项（未启用）
10. 修复在线编译时rdate缺失的问题
