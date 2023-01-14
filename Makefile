prefix ?= /usr/local
exec_prefix ?= $(prefix)
libexecdir ?= $(exec_prefix)/libexec

INSTALL ?= install

chrome-sandbox: sandbox/linux/suid/sandbox.c sandbox/linux/suid/process_util_linux.c
	$(CC) $(CPPFLAGS) -I. $(CFLAGS) $(LDFLAGS) -o $@ $^

install: chrome-sandbox
	$(INSTALL) -d "$(DESTDIR)$(libexecdir)"
	$(INSTALL) -m4711 chrome-sandbox "$(DESTDIR)$(libexecdir)"/chrome-sandbox
