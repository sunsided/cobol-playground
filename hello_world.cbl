      * Compile with `cobc -x hello_world.cbl`
       identification division.
       program-id. HelloWorld.
       environment division.
       data division.
       working-storage section.
           01 GREETING PIC X(13) VALUE "Hello, World!".
       procedure division.
           DisplayHello.
               display GREETING
      * The next line is a continuation from the one above. This isn't
      * considered good practice and will result in the compiler warning
      * "warning: continuation of COBOL words used [-Wdialect"
      -    ' from COBOL.'.
               stop run.
