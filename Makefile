prefix = $(HOME)
bindir = $(prefix)/bin
datadir = $(HOME)/.local/share
confdir = $(HOME)/.config

RM = rm -f
TAR = tar
FIND = find
INSTALL = install

ifneq ($(findstring $(MAKEFLAGS),s),s)
	QUIET_GEN   = @echo '  GEN   ' $@;
	QUIET_CP    = @echo '  CP    ' $@;
	QUIET_RM    = @echo '  RM    ' $@;
	QUIET_MKDIR = @echo '  MKDIR ' $@;
endif

ALL_SCRIPTS = jhbuild-dawati

install:
	$(INSTALL) -d -m 755 '$(DESTDIR)$(bindir)'
	$(INSTALL) -m 755 build/jhbuild-dawati.sh '$(DESTDIR)$(bindir)/jhbuild-dawati'
	$(INSTALL) -m 644 jhbuildrc-dawati '$(DESTDIR)$(HOME)/.jhbuildrc-dawati'
	if test -f '$(DESTDIR)$(HOME)/.jhbuildrc-dawati-custom' ; then \
		echo "*** Custom jhbuild config already exists - leaving well alone"; \
	else \
		$(INSTALL) -m 644 jhbuildrc-dawati-custom '$(DESTDIR)$(HOME)/.jhbuildrc-dawati-custom' ; \
	fi

install-session:
	$(INSTALL) -m 644 dawati-shell.desktop '$(DESTDIR)$(datadir)/applications/dawati-shell.desktop'
	$(INSTALL) -m 644 dawati.session '$(DESTDIR)$(confdir)/gnome-session/sessions/dawati.session'
	$(INSTALL) -m 644 xsessions/dawati.desktop '/usr/share/xsessions/dawati.session'
