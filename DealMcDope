;; Other system stuff
STDOUT equ 1
STDIN equ 0
STDERR equ 2

;; System sruff
SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

;; Exit Statuses 
ISTGUT equ 0
ISTNICHTGUT equ 66

;; Constants for buffers
DRUGBUF equ 02h

;; Constants for options
COCAINE equ 1
METH equ 2
WEED equ 3
CRACK equ 4

;; Player init stuff Starting testing leave me out of it
COCAINESTASH equ 0e6h
METHSTASH equ 082h
WEEDSTASH equ 012ch
CRACKSTASH equ 032h

%macro EXIT 1
  mov rax, SYS_EXIT
  mov rdi, %1
  syscall
%endmacro

%macro EXCLAIM 2
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, %1
  mov rdx, %2
  syscall
%endmacro

%macro GETOPT 2
  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, %1
  mov rdx, %2
  syscall
%endmacro

section .bss
drugopt resb 02h

section .data
    
    starbanner1 db "******************************************", 0ah ; 02bh
    starbanner2 db "**      Dealer       |      McDope      **", 0ah ; 02bh
    starbanner3 db "******************************************", 0ah ; 02bh
    OptionMenu1 db "== Deal Cocaine (1) ==  == Deal Meth  (2) ==", 0ah ; 02dh
    OptionMenu2 db "== Deal Weed    (3) ==  == Deal Crack (4) ==", 0ah ; 02dh
    TheQuestion db "Pick your poison scumbag: ", 0ah, ; 01bh

    OptionMenuCocaine db "== Amount ==     == Current Price ==", 0ah ;025h
    OptionMenuMeth db "== Amount ==     == Current Price ==", 0ah ;025h
    OptionMenuWeed db "== Amount ==     == Current Price ==", 0ah ;025h
    OptionMenuCrack db "== Amount ==     == Current Price ==", 0ah ;025h
    
    
section .text
    global _start

_start:

    call banner
    call optionmenu
    call thequestion
    call quits


banner:
    EXCLAIM starbanner1,02bh
    EXCLAIM starbanner2,02bh
    EXCLAIM starbanner3,02bh
    ret

optionmenu:
    EXCLAIM OptionMenu1,02dh
    EXCLAIM OptionMenu2,02dh
    ret

optionmenuCocaine:
    EXCLAIM OptionMenuCocaine,025h
    call quitsn

optionmenuMeth:
    EXCLAIM OptionMenuMeth,025h
    call quitsn

optionmenuWeed:
    EXCLAIM OptionMenuWeed,025h
    call quitsn

optionmenuCrack:
    EXCLAIM OptionMenuCrack,025h
    call quitsn

thequestion:
    EXCLAIM TheQuestion,01h
    GETOPT drugopt, DRUGBUF
    mov al, [drugopt]
    sub al, '0'
    cmp al, COCAINE
    je cocaine_dealer
    cmp al, METH
    je meth_dealer
    cmp al, WEED
    je weed_dealer
    cmp al, CRACK
    je crack_dealer
    
meth_dealer:
    call banner
    call optionmenuMeth
    ret
    
weed_dealer:
    call banner
    call optionmenuWeed
    ret
    
crack_dealer:
    call banner
    call optionmenuCrack
    ret

cocaine_dealer:
    call banner
    call optionmenuCocaine
    ret

quits:
    EXIT ISTGUT

quitsn:
    EXIT ISTNICHTGUT
