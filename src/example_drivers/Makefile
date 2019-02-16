FFLAGS += -I../code -I../integrators
LIB     = ../libi3rc.a
SRCS    = $(wildcard *.F95)
OBJS    = $(SRCS:.F95=.o)

.PHONY: all

all: $(LIB)

$(LIB): $(OBJS)
	$(AR) ruv $(LIB) $(OBJS)

%.o: %.F95
	$(FC) -c $(FFLAGS) $<
