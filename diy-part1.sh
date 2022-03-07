#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 去除源码注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加插件包
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/immortalwrt-collections/openwrt-passwall' >>feeds.conf.default
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/lean/luci-theme-infinityfreedom
git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
