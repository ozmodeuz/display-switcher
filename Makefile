BUNDLE_PATH = "display-configuration-switcher@knokelmaat.gitlab.com.zip"
EXTENSION_DIR = "$(HOME)/.local/share/gnome-shell/extensions/display-configuration-switcher@knokelmaat.gitlab.com"

all: build install

.PHONY: build install clean

build:
	rm -f $(BUNDLE_PATH); \
	cd $(EXTENSION_DIR); \
	dbus-run-session -- gnome-extensions pack --force \
	                      --extra-source=dbus.js/ \
	                      --extra-source=dialog.js; \
	mv $(EXTENSION_DIR).shell-extension.zip ../$(BUNDLE_PATH)

install:
	dbus-run-session -- gnome-extensions install $(BUNDLE_PATH) --force

enable:
	dbus-run-session -- gnome-extensions enable display-configuration-switcher@knokelmaat.gitlab.com.zip

run:
	dbus-run-session -- gnome-shell --nested --wayland

clean:
	@rm -fv $(BUNDLE_PATH)
