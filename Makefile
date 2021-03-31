EPT  = rpmsgexport
EPTD = rpmsgdestroyept

CFLAGS := -Wall -g -O2
LDFLAGS := 
prefix := /usr/local

SRCS := rpmsgexport.c
SRCS += rpmsgdestroyept.c
OBJS := $(SRCS:.c=.o)

all: $(EPT) $(EPTD)
.PHONY : all

$(EPTD): rpmsgdestroyept.o
	$(CC) $(LDFLAGS) -o $@ $^

install: $(EPT) $(EPTD)
	install -D -m 755 $(EPT) $(DESTDIR)$(prefix)/bin/$(EPT)
	install -D -m 755 $(EPTD) $(DESTDIR)$(prefix)/bin/$(EPTD)

clean:
	rm -f $(EPT) $(EPTD) $(OBJS)

distclean:
	rm -f $(DESTDIR)$(prefix)/bin/$(EPT)
	rm -f $(DESTDIR)$(prefix)/bin/$(EPTD)