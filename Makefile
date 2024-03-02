# Makefile for building COBOL programs and library

# Compiler and flags
COBC=cobc
CFLAGS=-free
LIBFLAGS=-m
EXEFLAGS=-x

# Source directories and output directory
SRC_DIR=src
BIN_DIR=bin

# Program names
EXAMPLE1_BIN_NAME=hello_world

EXAMPLE2_LIB_NAME=HelloLib
EXAMPLE2_BIN_NAME=hello_driver

EXAMPLE3_BIN_NAME=csv

# Source files
EXAMPLE1_BIN_SOURCE=$(SRC_DIR)/hello_world.cbl

EXAMPLE2_LIB_SOURCE=$(SRC_DIR)/hello_lib.cbl
EXAMPLE2_BIN_SOURCE=$(SRC_DIR)/hello_driver.cbl

EXAMPLE3_BIN_SOURCE=$(SRC_DIR)/csv.cbl

# Output files
EXAMPLE1_BIN_OUTPUT=$(BIN_DIR)/$(EXAMPLE1_BIN_NAME)

EXAMPLE2_LIB_OUTPUT=$(BIN_DIR)/$(EXAMPLE2_LIB_NAME)
EXAMPLE2_BIN_OUTPUT=$(BIN_DIR)/$(EXAMPLE2_BIN_NAME)

EXAMPLE3_BIN_OUTPUT=$(BIN_DIR)/$(EXAMPLE3_BIN_NAME)

# Default target
all: hello_world hello_driver

# Compile the hello_world program
hello_world: $(EXAMPLE1_BIN_SOURCE)
	$(COBC) $(CFLAGS) $(EXEFLAGS) -o $(EXAMPLE1_BIN_OUTPUT) $<

# Run the hello_world program
run_hello_world: hello_world
	./$(EXAMPLE1_BIN_OUTPUT)

# Compile the library
$(EXAMPLE2_LIB_OUTPUT): $(EXAMPLE2_LIB_SOURCE)
	$(COBC) $(CFLAGS) $(LIBFLAGS) -o $@ $<

# Compile the driver program and link with the library
hello_driver: $(EXAMPLE2_LIB_OUTPUT) $(EXAMPLE2_BIN_SOURCE)
	$(COBC) $(CFLAGS) $(EXEFLAGS) -o $(EXAMPLE2_BIN_OUTPUT) $(EXAMPLE2_BIN_SOURCE)

# Run the driver program
run_hello_driver: hello_driver
	export COB_LIBRARY_PATH=$(BIN_DIR) && ./$(EXAMPLE2_BIN_OUTPUT)

# Compile the csv program
csv: $(EXAMPLE3_BIN_SOURCE)
	$(COBC) $(EXEFLAGS) -o $(EXAMPLE3_BIN_OUTPUT) $<

# Run the hello_world program
run_csv: csv
	cd $(BIN_DIR) && ./$(EXAMPLE3_BIN_NAME)

# Clean the build
clean:
	rm -f $(BIN_DIR)/hello* $(BIN_DIR)/Hello* $(BIN_DIR)/csv

# Phony targets for cleanliness
.PHONY: all hello_driver hello_world csv run_hello_driver run_hello_world run_csv clean
