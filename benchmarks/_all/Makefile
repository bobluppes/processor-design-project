ROOT = ..

SRC_PI       = $(ROOT)/pi/pi.c
SRC_DIVIDE   = $(ROOT)/divide/divide.c
SRC_MULTIPLY = $(ROOT)/multiply/multiply.c
SRC_RSA      = $(ROOT)/rsa/rsa.c
SRC_SSD      = $(ROOT)/ssd/ssd.c
SRC_SSEARCH  = $(ROOT)/ssearch/ssearch.c
SRC_SUSAN    = $(ROOT)/susan/susan.c
SRC_CJPEG    = $(ROOT)/jpeg/cjpeg.c
SRC_FIR		 = $(ROOT)/fir/fir.c

ALL_SOURCES = $(SRC_PI) $(SRC_SUSAN) $(SRC_DIVIDE) $(SRC_FIR) $(SRC_RSA) $(SRC_CJPEG) $(SRC_SSEARCH) $(SRC_SSD) $(SRC_MULTIPLY)
ALL_OBJS = $(notdir $(ALL_SOURCES:.c=.o))

PROG = bench_all
OBJS = $(ALL_OBJS) $(ROOT)/ssd/basic_match_tests_aligned.o $(ROOT)/jpeg/rdppm.o $(ROOT)/jpeg/rdgif.o $(ROOT)/jpeg/rdtarga.o $(ROOT)/jpeg/rdrle.o $(ROOT)/jpeg/rdbmp.o \
	$(ROOT)/jpeg/rdswitch.o $(ROOT)/jpeg/cdjpeg.o $(ROOT)/jpeg/libjpeg.a

IMG_FILE = full_$(PROG).bin

CFLAGS += -DCUSTOM_MAIN -DALL_BENCHMARKS

include $(ROOT)/Makefile.common

pi.o: $(SRC_PI)
	$(CC) $(CFLAGS) -o $@ $<
divide.o: $(SRC_DIVIDE)
	$(CC) $(CFLAGS) -o $@ $<
multiply.o: $(SRC_MULTIPLY)
	$(CC) $(CFLAGS) -o $@ $<
fir.o: $(SRC_FIR)
	$(CC) $(CFLAGS) -o $@ $<
rsa.o: $(SRC_RSA)
	$(CC) $(CFLAGS) -o $@ $<
ssd.o: $(SRC_SSD)
	$(CC) $(CFLAGS) -o $@ $<
ssearch.o: $(SRC_SSEARCH)
	$(CC) $(CFLAGS) -o $@ $<
cjpeg.o: $(SRC_CJPEG)
	$(CC) $(CFLAGS) -o $@ $<
susan.o: $(SRC_SUSAN)
	$(CC) $(CFLAGS) -Wno-return-type -Wno-unused-value -Wno-unused-but-set-variable -Wno-unused-variable -Wno-implicit-int -o $@ $<
    