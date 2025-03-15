CC := gcc
CFLAGS := -Wall -Werror
TARGET := writer
SRC := writer.c
OBJ := writer.o

ifdef CROSS_COMPILE
    CC := $(CROSS_COMPILE)gcc
endif

all: clean $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)
