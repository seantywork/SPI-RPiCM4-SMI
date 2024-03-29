


GCC_FLAGS := -Ofast -Wall 

GCC_OBJ_FLAGS := -Ofast -Wall -c

INCLUDES := -I./include

LIBS := -lrt -lpthread -lpigpio -lc 

V1_OBJ := rpspi.o v1_stream.o v1_stream_reg.o v1_export.o v1_utils.o

# V1_OBJ_TEST := rpspi.o v1_stream.o v1_stream_test.o v1_utils.o

V1_OBJ_DMA := $(V1_OBJ) dma.o

all:

	@echo "rpspi server"



v1: $(V1_OBJ)

	gcc $(GCC_FLAGS) $(INCLUDES) -o v1.run src/main.c $(V1_OBJ) $(LIBS)


# v1test: $(V1_OBJ_TEST)

#	gcc $(GCC_FLAGS) $(INCLUDES) -o v1.test src/test.c $(V1_OBJ_TEST) $(LIBS)


v1dma: $(V1_OBJ_DMA)


	gcc $(GCC_FLAGS) $(INCLUDES) -o v1dma.run main.c $(V1_OBJ_DMA)

rpspi.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o rpspi.o src/rpspi.c

dma.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o dma.o src/dma/dma.c


v1_stream.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o v1_stream.o src/v1/stream.c


v1_stream_reg.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o v1_stream_reg.o src/v1/stream_reg.c


v1_export.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o v1_export.o src/v1/export.c

#v1_stream_test.o:

#	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o v1_stream_test.o src/v1/stream_test.c


v1_utils.o:

	gcc $(GCC_OBJ_FLAGS) $(INCLUDES) -o v1_utils.o src/v1/utils.c

sample:

	gcc $(GCC_FLAGS) $(INCLUDES) -o sample.run vendor/sample/spidev-testc.c $(LIBS)


clean:


	sudo rm -r *.run *.test *.o log/log.txt log/sock.txt

clean-log:

	sudo rm -r log/log.txt log/sock.txt
