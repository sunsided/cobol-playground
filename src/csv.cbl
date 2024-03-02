       identification division.
       program-id. ReadCSV.

       environment division.
       input-output section.
       file-control.
           select inputFile assign to 'example.csv'
               organization is line sequential.

       data division.
       file section.
       fd  inputFile.
       01  inputFileRecord pic X(100).

       working-storage section.
       01  endOfFile       pic X value 'N'.
           88 eof                value 'Y'.
           88 notEof             value 'N'.
       01  fileRecord.
           02 fileID       pic X(10).
           02 fileName     pic X(20).
           02 fileAge      pic 99.
       01  fieldDelimiter  pic X value ','.

       procedure division.
       begin.
           open input inputFile
           perform until eof
               read inputFile into inputFileRecord
                   at end
                       set eof to true
                   not at end
                       perform process-record
               end-read
           end-perform
           close inputFile
           stop run.

       process-record.
           unstring inputFileRecord delimited by fieldDelimiter
           into fileID, fileName, fileAge
           on overflow
               display 'Error: Record too long or too many fields'
           end-unstring

           inspect fileID replacing trailing spaces by low-values
           inspect fileName replacing trailing spaces by low-values
           display 'ID: ' fileID
                   ', Name: ' fileName
                   ', Age: ' fileAge.
