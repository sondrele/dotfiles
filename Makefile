
.PHONY: install install-packages install-all test

install:
	@./scripts/install

install-packages:
	@./scripts/install_packages -u

install-all: install-packages install

test:
	@./scripts/install test && tree -a test/ && rm -rf test/
