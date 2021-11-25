## 基于DHDAXCW骷髅头的R2S固件（docker版本）进行修改

自动编译每周三、周六发布。手动编译不定期更新。

# 目前主要改动如下

## 插件相关
1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）Watchcat（luci-app-watchcat）
3. 加入autotimeset
4. 加入iperf3
5. 继承docker版全插件衣钵 继续编译全插件版本

## 驱动相关
6. 由于lean的lede项目中加入了rtl8821cu的驱动，移除lean.sh中的svn语句

## 编译相关
9. 不生成rootfs格式的固件
10. 加入编译优化选项CONFIG_TARGET_OPTIMIZATION="-O3 -pipe -march=armv8-a+crypto+crc -mcpu=cortex-a53+crypto+crc -mtune=cortex-a53"（虽然modify_config.sh好像已经做了这件事...）
11. 修改beta_docker.config中的相关表述，加入CONFIG_EXPERIMENTAL、CONFIG_HAS_TESTING_KERNEL两个实验性选项

### 脚本升级
可能无法升级成功，仍建议卡刷
```
wget https://raw.githubusercontent.com/MilesPoupart/scripts/main/onlineupdate.sh && sh onlineupdate.sh
```