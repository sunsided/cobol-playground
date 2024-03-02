*> Compile with `cobc -x -free hello_world.cbl`
identification division.
program-id. HelloWorld.

environment division.

data division.
working-storage section.
    01 GREETING PIC X(13) VALUE "Hello, World!".

procedure division.
DisplayHello.
    display GREETING ' from COBOL.'.
    stop run.
