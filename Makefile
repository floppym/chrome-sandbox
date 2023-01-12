prefix ?= /usr/local
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin

INSTALL ?= install

chrome-sandbox: sandbox/linux/suid/sandbox.c sandbox/linux/suid/process_util_linux.c
	$(CC) $(CPPFLAGS) -I. $(CFLAGS) $(LDFLAGS) -o $@ $^

install: chrome-sandbox
	$(INSTALL) -d "$(DESTDIR)$(bindir)"
	$(INSTALL) -m4711 chrome-sandbox "$(DESTDIR)$(bindir)"/chrome-sandbox
