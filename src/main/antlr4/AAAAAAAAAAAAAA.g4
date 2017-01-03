/**
 * Grammar for AAAAAAAAAAAAAA!!!!
 * <p>
 * Note that while the language name features exclamation marks (!), Antlr itself does not allow these characters in the
 * grammar name.
 */
grammar AAAAAAAAAAAAAA;

program
    : (command ?)+ EOF
    ;

command
    : directive'!'
    ;

operator
    : 'AAAA' // AAAA = number 0
    | 'AAA' // AAA = number 1
    | 'A' // A = number 2
    | 'AA A' // AA A = number 3
    | 'AAAA A' // AAAA A = last index number read by a previous command
    | 'AAAAA,' operator // AAAAA, n = value at index n
    | 'AA A,' operator operator // AA A, a b = a+b
    | 'AA AA,' operator operator // AA AA, a b = abs(a-b)
    | 'AAA,' operator operator // AAA, a b = a*b
    | 'AA AAA,' operator operator // AA AAA, a b = a AND b
    | 'AAAA,' operator operator // AAAA, a b = a XOR b
    | 'AAAAAA' operator',' operator operator // AAAAAA n, a b = Call subroutine n with parameter a and b, and return value
    | 'AAAAA A' operator',' operator // AAAAA A n, a = Call subroutine n with parameter a and a, and return value
    | 'AAAAA AA' // AAAAA AA = First parameter
    | 'AAAAA AAA' // AAAAA AAA = Second parameter
    ;

directive
    : 'AA AAA' operator //AA AAA n! Outputs number as a character
    | 'AAA AAAA AA' operator // AAA AAAA AA n! Input a character store to index n
    | 'AAA AA' operator // AAA AA n! Go to label n
    | 'AAAAA' operator // AAAAA n! Define a label n
    | 'AAA AAAA AAA' operator // AAA AAAA AAA n! Skip n commands
    | 'AAAA AA' operator // AAAA AA n! Shift indexes n backwards
    | 'AAAA AAAA' operator // AAAA AAAA n! Shift indexes n forwards
    | 'AA AAAA AA' // AA AAAA AA! End program
    | 'AAA A AAA' operator // AAA A AAA n! Begin define subroutine named n
    | 'AAAA A AAA' // AAAA A AAA! End define subroutine
    | 'AAA A AA AAAA' operator // AAA A AA AAAA n! End subroutine, return value n
    | 'AAAAAA' operator // AAAAAA n! Call subroutine n
    | 'AAAA, AAAA' operator // AAAA, AAAA n! Forget n entries from subroutine stack
    | 'AAAA AAA' operator // AAAA AAA n! Increment value at index n
    | 'AAAA AAA,' operator // AAAA AAA, n! Decrement value at index n unless value is zero
    | 'AAAA, A' operator // AAAA, A n! Set command change register to n
    | 'AAAA, AA A' operator // AAAA, AA A n! Change all commands in program that start with what is in command change register to start with n instead
    | 'AAAA, AA AAA' operator // AAAA, AA AAA n! Change all commands in program that end with what is in command change register to end with n instead
    | 'AAAAA, AA A' operator // AAAAA, AA A n! Change all commands in program that start with n to start with what is in command change register instead
    | 'AAAAA, AA AAA' operator // AAAAA, AA AAA n! Change all commands in program that end with n to end with what is in command change register instead
    | 'AAAAA, AAAAA' // AAAAA, AAAAA! Clear command change register
    | 'AAAAA, AAAA A' operator // AAAAA, AAAA A n! Add block of n number of A's at end of command change register
    | 'AAAAA, AAAA AAA' operator // AAAAA, AAAA AAA n! Add block of n number of A's and comma at end of command change register
    ;