SRCS := $(wildcard *.c)
HDRS := $(wildcard *.h)
OBJS := $(patsubst %.c, %.o, $(SRCS))
PICS := $(patsubst %.c, %.pic, $(SRCS))
SLIB := liblinux.so
ALIB := liblinux.a

all: $(SLIB) $(ALIB)

$(SLIB): $(PICS)
	gcc -shared -o $@ $^

$(ALIB): $(OBJS)
	ar rcs $@ $^

%.o: %.c $(HDRS)

%.pic: %.c $(HDRS)
	gcc -c -fPIC -o $@ $<

clean:
	rm -f $(OBJS) $(PICS) $(SLIB) $(ALIB)

.PHONY: all clean
