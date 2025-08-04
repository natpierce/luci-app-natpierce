#!/bin/sh

uci_tool=/sbin/uci

# 官网版本号 URL
url="https://www.natpierce.cn/tempdir/info/version.html"

latest_version=$(wget -qO- "$url")

if [ -n "$latest_version" ]; then
    $uci_tool set natpierce.status.latest_version="$latest_version"
    $uci_tool commit natpierce
    echo "获取最新版本号成功：$latest_version"
    exit 0
else
    echo "错误：无法获取最新版本号，请检查网络。"
    exit 1
fi