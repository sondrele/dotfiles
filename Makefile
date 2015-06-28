
.PHONY: install install-packages install-all

install:
	@sh ./install/install

install-packages:
	@sh ./install/install_packages -u

install-all: install-packages install

test:
	@sh ./install/install test && tree -a test/ && rm -rf test/
