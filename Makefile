SRC_DIR=$(shell pwd)
INSTALL_DIR=$(HOME)

DIRS=\
	$(INSTALL_DIR)/.i3\
	$(INSTALL_DIR)/.config/i3status\
	$(INSTALL_DIR)/.config/dunst\
	$(INSTALL_DIR)/.config/sublime-text-3/Packages/User

BASH_ENV=bashrc.sh\
	profile.sh\
	bash_aliases.sh\
	bash_utils.sh

PY_SCRIPTS=i3-exit.py\
	i3status-wrapper.py\
	spotify-control.py

.PHONY: all directories bash i3configs i3scripts

all: directories bash i3configs i3scripts gitconfig sublimeconfig
	@echo "[Installed all in: $(INSTALL_DIR)]"

directories: $(DIRS)

$(DIRS):
	mkdir -p $(DIRS)

%.sh:
	cp $(SRC_DIR)/bash/$@ $(INSTALL_DIR)/.$(@:.sh=)

bash: $(BASH_ENV)
	@echo "[Configured bash environment]"

i3configs:
	cp $(SRC_DIR)/i3/config $(INSTALL_DIR)/.i3/config
	cp $(SRC_DIR)/i3status/config $(INSTALL_DIR)/.config/i3status/config
	cp $(SRC_DIR)/dunst/dunstrc $(INSTALL_DIR)/.config/dunst/dunstrc
	@echo "[Configured i3]"

%.py:
	ln -sf $(SRC_DIR)/scripts/$@ $(INSTALL_DIR)/.i3/$@
	@chmod +x $(SRC_DIR)/scripts/$@

i3scripts: $(PY_SCRIPTS)
	@echo "[Linked python scripts]"

gitconfig:
	cp $(SRC_DIR)/git/gitconfig $(INSTALL_DIR)/.gitconfig
	@echo "[Configured git]"

sublimeconfig:
	cp $(SRC_DIR)/sublime/Default\ \(Linux\).sublime-keymap $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/
	cp $(SRC_DIR)/sublime/Preferences.sublime-settings $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/
	@echo "[Configured Sublime]"
