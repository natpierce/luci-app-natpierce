#!/bin/sh

uci_tool=/sbin/uci
PROG_BIN="/usr/share/natpierce/natpierce"
# 官网版本号 URL
url="https://www.natpierce.cn/tempdir/info/version.html"
latest_version=$(wget -qO- "$url")

if [ ! -f "$PROG_BIN" ]; then
    $uci_tool set natpierce.status.current_version="N/A"
    $uci_tool commit natpierce
fi

if [ -n "$latest_version" ]; then
    $uci_tool set natpierce.status.latest_version="$latest_version"
    $uci_tool commit natpierce
    echo "获取最新版本号成功：$latest_version"
    exit 0
else
    $uci_tool set natpierce.status.latest_version="N/A"
    $uci_tool commit natpierce
    echo "错误：无法获取最新版本号，请检查网络。"
    exit 1
fi