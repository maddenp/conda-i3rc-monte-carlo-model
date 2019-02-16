INCDIR  = $(PREFIX)/include

.PHONY: all

all: $(INCDIR)
	$(MAKE) -C code
	$(MAKE) -C integrators
	$(MAKE) -C example_drivers
	$(MAKE) -C tools

$(INCDIR):
	mkdir -p $(INCDIR)
