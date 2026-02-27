PREFIX ?= /usr
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions
MANDIR ?= $(PREFIX)/share/man
BASHCOMPDIR ?= /etc/bash_completion.d

all:
	@echo "pass-find-star is a shell script and does not need compilation, it can be simply executed."
	@echo ""
	@echo "To install it try \"make install\" instead."
	@echo
	@echo "To run pass find-star one needs to have some tools installed on the system:"
	@echo "     password store"
	@echo "     tail"
	@echo "     pass-extension-tail"

install:
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -v -m 0644 man/pass-extension-find-star.1 "$(DESTDIR)$(MANDIR)/man1/pass-find-star.1"
	@install -v -d "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/"
	@install -v -m 0755 src/find-list.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-list.bash"
	@install -v -m 0755 src/find-tail.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-tail.bash"
	@install -v -m 0755 src/find-show.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-show.bash"
	@install -v -d "$(DESTDIR)$(BASHCOMPDIR)/"
	@install -v -m 0644 completion/pass-find.bash.completion "$(DESTDIR)$(BASHCOMPDIR)/pass-find"
	@echo
	@echo "pass-find-star is installed successfully"
	@echo

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-list.bash" \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-tail.bash" \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/find-show.bash" \
		"$(DESTDIR)$(MANDIR)/man1/pass-find-star.1" \
		"$(DESTDIR)$(BASHCOMPDIR)/pass-find"

lint:
	shellcheck -s bash src/find-list.bash
	shellcheck -s bash src/find-tail.bash
	shellcheck -s bash src/find-show.bash

.PHONY: install uninstall lint
