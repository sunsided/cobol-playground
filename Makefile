# Makefile for compiling and running COBOL programs using GnuCOBOL (cobc)

# Compiler settings
COBC := cobc
COBCFLAGS := -x -free -Wall

# Find all COBOL program source files in the current directory
SRC := $(wildcard *.cbl)

# Target executable names are derived from the source file names
EXE := $(SRC:.cbl=)

.PHONY: all clean run

# Default target: compile all programs
all: $(EXE)

# Rule for compiling COBOL programs
%: %.cbl
	$(COBC) $(COBCFLAGS) $< -o $@

# Rule for running all compiled programs (optional, depending on your needs)
run: $(EXE)
	@for program in $^ ; do \
		echo Running $$program... ; \
		./$$program ; \
	done

# Clean up compiled executables
clean:
	rm -f $(EXE)

