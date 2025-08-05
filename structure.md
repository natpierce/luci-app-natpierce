# 这是项目文件结构
```
├── README.md                               # 项目说明文档
|
├── scripts/                                # 可用脚本目录
|    └── get_contributors.sh                # 注入社区贡献脚本
│
└── luci-app-natpierce/                     # 插件核心目录
    ├── Makefile                            # 插件的构建规则
    │
    └── luasrc/                             # Lua 源代码目录
        ├── controller/                     # 后端控制器目录
        │   └── natpierce.lua               # 路由和菜单定义
        │
        ├── model/                          # 配置模型目录
        │   └── cbi/                        # CBI 模型目录
        │       └── natpierce/          
                    ├── natpierce.lua       # UI 与配置的绑定       
        │           └── contributors.lua    # 贡献者信息(由get_contributors.sh自动生成)
        └── view/                           # 视图文件目录
            └── natpierce/                  # 插件视图目录
                ├── status.htm              # 前端
                └── advanced.htm            # 高级选项
    │
    └── root/                               # 安装到系统根目录的文件
        ├── etc/                            # 配置文件目录
        │   └── config/                     # UCI 配置目录
        │       └── natpierce               # UCI 配置文件模板
        │   └── init.d/
        │       └── natpierce               # 服务启动脚本
        │
        └── usr/                            # 用户程序和数据目录
            └── share/                      # 共享文件目录
                └── natpierce/              # 插件私有目录
                    ├── natpierce           # 核心二进制程序
                    ├── update.sh           # 更新脚本
                    └── upgrade.sh          # 升级脚本
```  
