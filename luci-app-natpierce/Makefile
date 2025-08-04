include $(TOPDIR)/rules.mk

LUCI_TITLE:=皎月连内网穿透
LUCI_DEPENDS:=+luci-base +luci-lib-nixio +luci-compat
LUCI_PKGARCH:=all
PKG_NAME:=luci-app-natpierce
PKG_VERSION:=1.0.0
PKG_RELEASE:=20250804
PKG_DESCRIPTION:=皎月连一键内网穿透是一款纯P2P连接软件，能够组建虚拟局域网或是将本地局域网内的主机端口直接映射到远程主机。

DEPENDS:=+kmod-tun

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-natpierce/install
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./root/etc/init.d/natpierce $(1)/etc/init.d/
	
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_DATA) ./root/etc/config/natpierce $(1)/etc/config/
	
	$(INSTALL_DIR) $(1)/usr/share/natpierce/
	$(INSTALL_BIN) ./root/usr/share/natpierce/update.sh $(1)/usr/share/natpierce/
	$(INSTALL_BIN) ./root/usr/share/natpierce/upgrade.sh $(1)/usr/share/natpierce/
endef

$(eval$(call BuildPackage,luci-app-natpierce))