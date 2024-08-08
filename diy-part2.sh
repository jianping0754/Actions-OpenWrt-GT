#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 自定义定制选项
ZZZ="package/lean/default-settings/files/zzz-default-settings"
#
sed -i "/uci commit fstab/a\uci commit network" $ZZZ
sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.31.3'" $ZZZ                                     # IPv4 地址(openwrt后台地址)
sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ                                   # IPv4 子网掩码
sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.31.1'" $ZZZ                                    # IPv4 网关
sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.31.255'" $ZZZ                                # IPv4 广播
sed -i "/uci commit network/i\uci set network.lan.dns='192.168.31.201 202.96.128.86 202.96.128.166'" $ZZZ         # DNS(多个DNS要用空格分开)
sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                                              # 去掉LAN口使用内置的 IPv6 管理
echo "close_dhcp" > package/base-files/files/etc/closedhcp                                                        # 关闭DHCP服务

sed -i "s/OpenWrt /Standard Edition Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ                   # 增加个性化版本名Standard Edition
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-GT'" $ZZZ                                # 修改主机名称为OpenWrt-GT
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                                            # 设置密码为空
sed -i 's/PATCHVER:=6.1/PATCHVER:=6.6/g' target/linux/x86/Makefile                                                # 修改内核为6.6

# 修改默认主题为infinityfreedom
sed -i 's/luci-theme-bootstrap/luci-theme-infinityfreedom/g' feeds/luci/collections/luci/Makefile               
sed -i 's/luci-theme-bootstrap/luci-theme-infinityfreedom/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-infinityfreedom/g' feeds/luci/collections/luci-ssl-nginx/Makefile
