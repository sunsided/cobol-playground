# Makefile for building COBOL driver and library.

# Compiler and flags
COBC=cobc
CFLAGS=-free
LIBFLAGS=-m
EXEFLAGS=-x

# Directories
SRC_DIR=src
BIN_DIR=bin

# Source files
LIB_SOURCE=$(SRC_DIR)/hello_lib.cbl
DRIVER_SOURCE=$(SRC_DIR)/hello_driver.cbl

# Output
LIB_OUTPUT=$(BIN_DIR)/HelloLib
DRIVER_OUTPUT=$(BIN_DIR)/hello_driver

# Default target
.PHONY: all clean run
all: $(DRIVER_OUTPUT)

# Compile the library
$(LIB_OUTPUT): $(LIB_SOURCE)
	@mkdir -p $(BIN_DIR)
	$(COBC) $(CFLAGS) $(LIBFLAGS) -o $@ $<

# Compile the driver program and link with the library
$(DRIVER_OUTPUT): $(DRIVER_SOURCE) $(LIB_OUTPUT)
	$(COBC) $(CFLAGS) $(EXEFLAGS) -o $@ $(DRIVER_SOURCE)

# Run the driver program
run: $(DRIVER_OUTPUT)
	export COB_LIBRARY_PATH=$(BIN_DIR) && ./$(DRIVER_OUTPUT)

# Clean the build
clean:
	rm -rf $(BIN_DIR)
