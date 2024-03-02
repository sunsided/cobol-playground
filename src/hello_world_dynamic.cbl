       identification division.
       program-id. HelloWorld.

       data division.
       working-storage section.

       procedure division.
           main.
               call 'HelloLib'   *> Assuming 'HelloLib' is the program-id in hello_lib.cbl
               stop run.
