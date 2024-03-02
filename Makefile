# Makefile for compiling COBOL programs using GnuCOBOL (cobc)

# Compiler settings
COBC := cobc
COBCFLAGS := -x -free -Wall
LIBFLAGS := -m -free -Wall # For compiling shared libraries

# Directories
SRCDIR := src
BINDIR := bin

# Phony targets for build and run commands
.PHONY: all clean run_hello_world run_hello_world_dynamic hello_world hello_world_dynamic

all: hello_world hello_world_dynamic

# Build the simple hello_world program
hello_world: $(BINDIR)/hello_world
$(BINDIR)/hello_world: $(SRCDIR)/hello_world.cbl
	@mkdir -p $(BINDIR)
	$(COBC) $(COBCFLAGS) $< -o $@

# Build the hello_world_dynamic program and its dependency, the hello_lib
hello_world_dynamic: $(BINDIR)/hello_world_dynamic
$(BINDIR)/hello_world_dynamic: $(SRCDIR)/hello_world_dynamic.cbl $(BINDIR)/libhello_lib.so
	@mkdir -p $(BINDIR)
	$(COBC) $(COBCFLAGS) $< -o $@ -L$(BINDIR) -lhello_lib

# Build the hello_lib shared library
$(BINDIR)/libhello_lib.so: $(SRCDIR)/hello_lib.cbl
	@mkdir -p $(BINDIR)
	$(COBC) $(LIBFLAGS) $< -o $@

# Run the simple hello_world program
run_hello_world: hello_world
	@./$(BINDIR)/hello_world

# Run the hello_world_dynamic program, ensuring the dynamic linker can find the shared library
run_hello_world_dynamic: hello_world_dynamic
	@LD_LIBRARY_PATH=$(BINDIR) ./$(BINDIR)/hello_world_dynamic

# Clean the bin directory
clean:
	rm -f $(BINDIR)/*
