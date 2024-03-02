       identification division.
       program-id. HelloLib.

       data division.
       linkage section.
           01 GREETING PIC X(255).

       procedure division using GREETING.
       DisplayHello.
           display GREETING ' from COBOL.'.
           goback.
