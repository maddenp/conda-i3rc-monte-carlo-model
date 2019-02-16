BINS     = MakeMieTable PhysicalPropertiesToDomain OpticalPropertiesToDomain
OBJS     = $(SRCS:.f=.o)
SRCS     = $(wildcard *.f)
FFLAGS  += -I../code
LDFLAGS += -L..
LIBS     = -li3rc -lnetcdf -lnetcdff

.PHONY: all

all: $(BINS)

$(BINS): $(OBJS)
	$(FC) -o $(PREFIX)/bin/$@ $(FFLAGS) $@.F95 $(OBJS) $(LDFLAGS) $(LIBS)

%.o: %.f
	$(FC) -c $(FFLAGS) $<
