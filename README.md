## 基于DHDAXCW骷髅头的R2S固件（docker版本）进行修改
尝试了改为5.10内核，但屡屡失败（咱也不懂，咱也不敢问）放弃了...

自动编译每天发布。手动编译不定期更新。
# 目前主要改动如下
## 插件相关
1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）Watchcat（luci-app-watchcat）
3. 加入autotimeset
4. 加入iperf3

## 驱动相关
5. ~~移除lean.sh中失效的rtl8192du链接~~上游已更正驱动链接为rtl8192eu，已同步更正
6. 由于lean的lede项目中加入了rtl8821cu的驱动，移除lean.sh中的svn语句
7. 十分头铁地依然使用新版uboot（即撤销了[这一次commit](https://github.com/DHDAXCW/NanoPi-R2S-2021/commit/0e1b1ff00a02357d4dad63f2d50570686cc53e6f)）

## 编译相关
8. 不生成rootfs格式的固件
9. 加入编译优化选项CONFIG_TARGET_OPTIMIZATION="-O3 -pipe -march=armv8-a+crypto+crc -mcpu=cortex-a53+crypto+crc -mtune=cortex-a53"（虽然modify_config.sh好像已经做了这件事...）
10. 修改beta_docker.config中的相关表述，加入CONFIG_EXPERIMENTAL、CONFIG_HAS_TESTING_KERNEL两个实验性选项
