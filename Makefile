SHELL := /bin/bash
.ONESHELL:
.PHONY: all clean install

UNAME_S := $(shell uname -s)

all: install

install:
	@chmod +x set_new_mac.sh set_new_arch.sh set_new_server.sh
	@echo "Detected OS: $(UNAME_S)"
	
	@if [ "$(UNAME_S)" = "Darwin" ]; then \
		echo "Starting macOS setup..."; \
		./set_new_mac.sh; \
	elif [ "$(UNAME_S)" = "Linux" ]; then \
		if [ -f /etc/arch-release ]; then \
			echo "Arch Linux detected. Starting Arch setup..."; \
			./set_new_arch.sh; \
		elif [ -f /etc/debian_version ]; then \
			echo "Debian/Ubuntu detected. Starting server setup..."; \
			./set_new_server.sh; \
		else \
			echo "Unknown Linux distribution. Please run the specific script manually."; \
			exit 1; \
		fi \
	else \
		echo "Unsupported OS."; \
		exit 1; \
	fi

clean:
	rm -rf ~/.dotfiles
