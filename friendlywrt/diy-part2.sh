#!/bin/bash


## 修改openwrt登陆地址,把下面的192.168.11.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate


## 取消原主题luci-theme-bootstrap为默认主题
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

## 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

## r2s r2c风扇脚本
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/init.d/fa-rk3328-pwmfan
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/usr/bin/start-rk3328-pwm-fan.sh
