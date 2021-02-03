EPT  = rpmsgexport
EPTD = rpmsgdestroyept
PING = ping

CFLAGS := -Wall -g -O2
LDFLAGS := 
prefix := /usr/local

SRCS := rpmsgexport.c
SRCS += rpmsgdestroyept.c
SRCS += ping.c
OBJS := $(SRCS:.c=.o)

all: $(EPT) $(EPTD) $(PING)
.PHONY : all

$(EPT): rpmsgexport.o
	$(CC) $(LDFLAGS) -o $@ $^

$(EPTD): rpmsgdestroyept.o
	$(CC) $(LDFLAGS) -o $@ $^

$(PING): ping.o
	$(CC) $(LDFLAGS) -o $@ $^

install: $(EPT) $(EPTD) $(PING)
	install -D -m 755 $(EPT) $(DESTDIR)$(prefix)/bin/$(EPT)
	install -D -m 755 $(EPTD) $(DESTDIR)$(prefix)/bin/$(EPTD)
	install -D -m 755 $(PING) $(DESTDIR)$(prefix)/bin/$(PING)

clean:
	rm -f $(EPT) $(EPTD) $(PING) $(OBJS)

distclean:
	rm -f $(DESTDIR)$(prefix)/bin/$(EPT)
	rm -f $(DESTDIR)$(prefix)/bin/$(EPTD)
	rm -f $(DESTDIR)$(prefix)/bin/$(PING)