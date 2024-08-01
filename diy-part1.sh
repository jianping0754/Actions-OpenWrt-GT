#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 去除源码注释
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加插件包
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone https://github.com/jianping0754/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/jianping0754/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jianping0754/luci-theme-infinityfreedom.git package/lean/luci-theme-infinityfreedom
git clone https://github.com/jianping0754/luci-theme-rosy.git package/lean/luci-theme-rosy
# git clone https://github.com/jianping0754/OpenWrt-Theme/luci-theme-infinityfreedom.git package/theme

# 移除 openwrt feeds 自带的核心包
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/sbwml/openwrt_helloworld package/helloworld

# 更新 golang 1.22 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
