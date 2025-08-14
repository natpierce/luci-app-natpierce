#!/bin/sh

# 定义 GitHub 仓库信息和文件路径
REPO="XingHeYuZhuan/luci-app-natpierce"
API_URL="https://api.github.com/repos/${REPO}/contributors"

# 定义文件输出路径，这些路径是相对于仓库根目录的
OUTPUT_LUA_FILE="luci-app-natpierce/luasrc/model/cbi/natpierce/contributors.lua"
AVATAR_DIR="luci-app-natpierce/htdocs/luci-static/natpierce/avatars"

# 确保脚本有执行权限
chmod +x "$0"

# 检查依赖工具
command -v curl >/dev/null || { echo "错误: 需要'curl'工具来下载数据"; exit 1; }
command -v jq >/dev/null || { echo "错误: 需要'jq'工具来解析 JSON"; exit 1; }

echo "--- 正在从 GitHub API 获取贡献者列表... ---"

# 从 GitHub API 获取贡献者列表
DATA=$(curl -s "${API_URL}")

# 检查API请求是否成功
if [ -z "$DATA" ]; then
    echo "错误: 无法从 GitHub API 获取数据，请检查仓库名称或网络连接。"
    exit 1
fi

echo "--- 成功获取数据，正在下载头像并生成 Lua 文件... ---"

# 清理旧的头像目录和文件，以防数据不一致
rm -rf "${AVATAR_DIR}"
mkdir -p "${AVATAR_DIR}"

# 开始生成 Lua 文件
echo "return {" > "${OUTPUT_LUA_FILE}"

# 遍历JSON数据，下载头像并构建 Lua 表格
echo "$DATA" | jq -c '.[]' | while read -r contributor; do
    LOGIN=$(echo "$contributor" | jq -r '.login')
    HTML_URL=$(echo "$contributor" | jq -r '.html_url')
    AVATAR_URL=$(echo "$contributor" | jq -r '.avatar_url')

    # 使用 GitHub API 内置的尺寸参数来获取 64x64 像素的头像
    AVATAR_URL_RESIZED="${AVATAR_URL}&s=64"

    AVATAR_PATH="luci-static/natpierce/avatars/${LOGIN}.png"
    echo "下载头像: ${AVATAR_URL_RESIZED}"
    
    # 直接下载已经压缩和缩放过的头像到本地
    curl -s -o "${AVATAR_DIR}/${LOGIN}.png" "${AVATAR_URL_RESIZED}"

    # 将数据写入 Lua 文件，使用本地头像路径
    echo "  {" >> "${OUTPUT_LUA_FILE}"
    echo "    name = \"${LOGIN}\"," >> "${OUTPUT_LUA_FILE}"
    echo "    url = \"${HTML_URL}\"," >> "${OUTPUT_LUA_FILE}"
    echo "    avatar = \"${AVATAR_PATH}\"" >> "${OUTPUT_LUA_FILE}"
    echo "  }," >> "${OUTPUT_LUA_FILE}"
done

echo "}" >> "${OUTPUT_LUA_FILE}"
echo "--- 任务完成，文件已生成。 ---"