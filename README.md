## 基于DHDAXCW骷髅头的R2S固件进行修改

<img src="https://img.shields.io/github/downloads/MilesPoupart/NanoPi-R2S/total.svg?style=for-the-badge&color=32C955"/>


由于免费的Github-hosted runners磁盘空间由100GB大幅缩水到[14GB](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources)，
**在线编译已不可行**。已全面切换到自托管设备编译，固件更新将在上游更新后进行。

考虑到稳定性问题，docker（精简）版本仅生成ext4固件；全插件（精简）版本生成ext4、SQUASHFS格式的固件

**后台地址仍为192.168.2.1！！！**

# 精简版本主要改动如下

1. 将全能推送（luci-app-pushbot）替换为原微信推送（luci-app-serverchan）
2. 恢复加入Onliner User（luci-app-onliner）
3. 恢复加入Watchcat（luci-app-watchcat）
4. 恢复加入turboacc（luci-app-turboacc）
5. 加入iperf3、netspeedtest、partexp、luci-app-autotimeset
6. netdata采用sirpdboy源
7. 其他插件差别为：
    + 进一步去除airplay2、aliddns、brook-server、cifs-mount、familycloud、fileassistant、filebrowser、filetransfer、frpc、frps、guest-wifi、haproxy-tcp、hd-idle、jd-dailybonus、ikoolproxy、music-remote-center、mwan3、mwan3helper、n2n_v2、nfs、nps、openvpn-server、ps3netsrv、rclone、softethervpn、sqm、syncdial、tencentddns、transmission、trojan-server、unblockneteasemusic、uugamebooster、wifischedule、mentohust；
    + 恢复保留verysync。
