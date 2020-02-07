LIB  = ../libi3rc.a
OBJS = $(SRCS:.F95=.o)
SRCS = $(wildcard *.F95)

.PHONY: all

all: $(LIB)

$(LIB): $(OBJS)
	$(AR) ruv $(LIB) $(OBJS)

%.o: %.F95
	$(FC) -c $(FFLAGS) $<

inversePhaseFunctions.o: numericUtilities.o scatteringPhaseFunctions.o ErrorMessages.o
kDistribution.o: ErrorMessages.o
monteCarloIllumination.o: RandomNumbersForMC.o ErrorMessages.o
opticalProperties.o: scatteringPhaseFunctions.o characterUtils.o ErrorMessages.o
scatteringPhaseFunctions.o: numericUtilities.o characterUtils.o ErrorMessages.o
surfaceProperties.o: numericUtilities.o ErrorMessages.o
userInterface_Unix.o: multipleProcesses.o ErrorMessages.o
