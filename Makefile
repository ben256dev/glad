# Variables
STATIC_LIB = libglad.a
SHARED_LIB = libglad.so
SRC = glad.c
OBJ = $(SRC:.c=.o)
INCLUDE_DIR = .

# Compiler and Archiver
CC = gcc
AR = ar
ARFLAGS = rcs
CFLAGS = -fPIC -I$(INCLUDE_DIR)

# Rules
all: $(STATIC_LIB) $(SHARED_LIB)

# Static Library
$(STATIC_LIB): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

# Shared Library
$(SHARED_LIB): $(OBJ)
	$(CC) -shared -o $@ $^

# Compile Object Files
%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

# Clean up build artifacts
clean:
	rm -f $(OBJ) $(STATIC_LIB) $(SHARED_LIB)

.PHONY: all clean

