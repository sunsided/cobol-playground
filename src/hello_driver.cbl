       identification division.
       program-id. HelloDriver.

       environment division.
       configuration section.
       special-names.
           call-convention 1 is dynamic-call.

       data division.
       working-storage section.
           01 GREETING PIC X(255) VALUE "Hello, World!".

       procedure division.
           call 'HelloLib' using GREETING.
           stop run.
