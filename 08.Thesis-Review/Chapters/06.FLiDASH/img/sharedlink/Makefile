CC=gnuplot

SRCS := $(wildcard *.plt)
BINS := $(SRCS:%.plt=%.eps)

all: ${BINS}

%.eps: %.plt
	$(CC) $< || true

clean:
	rm *.eps
