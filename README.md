# luci-app-natpierce  
[gituhub仓库地址](https://github.com/natpierce/luci-app-natpierce "https://github.com/natpierce/luci-app-natpierce")

这是基于[natpierce-extend](https://github.com/natpierce/natpierce-extend)的逻辑进行重构的natpierce luci应用

## 亮点
> 默认ipk不再包括二进制文件减小包体积,包含二进制文件的包体积在4MB左右 重构的包体积在 10KB左右  
> 标记了强依赖,安装时将强要求安装<code>**luci-base luci-lib-nixio luci-compat kmod-tun**</code>  
> 安装的初始化过程会下载最新的natpierce包,不需要手动初始化  
> 集成**更新**和**升级**选项,可以在用户的意愿下更新natpierce程序  
> 提供luci页面清除natpierce程序配置文件功能,使用post提供安全性 防止 CSRF (跨站请求伪造) 攻击  
> 服务状态更新跟踪方式,只跟踪自身的natpierce程序,不会获取到其他同名进程(如在docker运行的natpierce)  
> 提供的包架构限制为all,对于natpierce程序是否支持本机架构请参考皎月连官网提供的对应架构natpierce二进制程序  

## apk管理器如何安装包  
在图片位置添加我们的**openwrt_natpierce_public.pem**公钥,才可以使用包管理器正常安装  
不然你就需要使用`apk add --allow-untrusted ./luci-app-natpierce.apk`忽略签名验证安装  
![apk包](/assets/img/demo3.png)   
#### 公钥文件下载  
[openwrt_natpierce_public.pem](https://raw.githubusercontent.com/natpierce/luci-app-natpierce/refs/heads/main/assets/Public_key/openwrt_natpierce_public.pem "文件下载")  

## 预览图片  
### 菜单  
![菜单](/assets/img/demo1.png)  
### 贡献卡片  
![贡献卡片](/assets/img/demo2.png) 


## 贡献  
欢迎任何人提交你的贡献  
[![Contributors](https://contributors-img.web.app/image?repo=natpierce/luci-app-natpierce&max=105&columns=15)](https://github.com/natpierce/luci-app-natpierce/graphs/contributors)