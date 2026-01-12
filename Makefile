include config.mk

all:

install: all
	mkdir -p ${PREFIX}/bin
	cp -f scripts/dwmui-adm ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/dwmui-adm
	cp -f scripts/dwmui-backlight ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/dwmui-backlight
	cp -f scripts/dwmui-battery ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/dwmui-battery
	cp -f scripts/dwmui-rfkill ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/dwmui-rfkill
	cp -f scripts/dwmui-volume ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/dwmui-volume
	sed -e "s|INSTALLDIR|${PREFIX}/bin|g" < 99-dwmui.rules > /etc/udev/rules.d/99-dwmui.rules
	chmod 644 /etc/udev/rules.d/99-dwmui.rules

uninstall:
	rm -f ${PREFIX}/bin/dwmui-adm\
	      ${PREFIX}/bin/dwmui-backlight\
	      ${PREFIX}/bin/dwmui-battery\
	      ${PREFIX}/bin/dwmui-rfkill\
	      ${PREFIX}/bin/dwmui-volume\
	      /etc/udev/rules.d/99-dwmui.rules

.PHONY: all install uninstall
