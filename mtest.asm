SYS_WRITE equ 01h
STDOUT equ 01h
SYS_EXIT equ 03ch
NEW_LINE equ 0ah

%macro SPRECHEN 2
mov rax, SYS_WRITE
mov rdi, STDOUT
mov rsi, %1
mov rdx, %2
syscall
%endmacro

%macro AUSFAHRT 0
mov rax, SYS_EXIT
mov rdi, 0
syscall
%endmacro

section .data
mf db "Meine Freunde!", 0ah ;len 0fh
brav db "Change your luck!", 0ah ; len 012h


section .text
global _start

_start:

SPRECHEN mf, 0fh
SPRECHEN brav, 012h
AUSFART

