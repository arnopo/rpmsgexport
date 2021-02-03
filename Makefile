EPT  = rpmsgexport
EPTD = rpmsgdestroyept
PING = ping
DEV  = rpmsgexportdev

CFLAGS := -Wall -g -O2
LDFLAGS := 
prefix := /usr/local

SRCS := rpmsgexport.c
SRCS += rpmsgdestroyept.c
SRCS += ping.c
SRCS += rpmsgexportdev.c
OBJS := $(SRCS:.c=.o)

all: $(EPT) $(EPTD) $(PING) $(DEV)
.PHONY : all

$(EPT): rpmsgexport.o
	$(CC) $(LDFLAGS) -o $@ $^

$(EPTD): rpmsgdestroyept.o
	$(CC) $(LDFLAGS) -o $@ $^

$(PING): ping.o
	$(CC) $(LDFLAGS) -o $@ $^


$(DEV): rpmsgexportdev.o
	$(CC) $(LDFLAGS) -o $@ $^

install: $(EPT) $(EPTD) $(PING) $(DEV)
	install -D -m 755 $(EPT) $(DESTDIR)$(prefix)/bin/$(EPT)
	install -D -m 755 $(EPTD) $(DESTDIR)$(prefix)/bin/$(EPTD)
	install -D -m 755 $(PING) $(DESTDIR)$(prefix)/bin/$(PING)
	install -D -m 755 $(DEV) $(DESTDIR)$(prefix)/bin/$(DEV)

clean:
	rm -f $(EPT) $(EPTD) $(PING) $(OBJS) $(DEV)

distclean:
	rm -f $(DESTDIR)$(prefix)/bin/$(EPT)
	rm -f $(DESTDIR)$(prefix)/bin/$(EPTD)
	rm -f $(DESTDIR)$(prefix)/bin/$(PING)
	rm -f $(DESTDIR)$(prefix)/bin/$(DEV)
