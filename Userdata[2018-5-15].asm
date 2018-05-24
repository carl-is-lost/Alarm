.386
.model flat,stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib

.data
MsgBoxCaption  db "Iczelion Tutorial No.2",0
MsgBoxText		db "First Line of text",13,10
				db "Press yes to run again",13,10
				db "Press no to exit",13,10
				db "Last line here",0
MsgBoxText2		db "Incorrect. The password does not match ",13,10
				db "Press  ",13,10
				db "Would you like to try again?",0

Line1	db "username: ",0
Line2	db ?
Line3	db "test",0
Line4	db "test",0

.code
start:

L3:

mov esi, OFFSET Line1
mov edi, OFFSET Line3
cmpsd
je L1

;Runs this messagebox if not equal
invoke MessageBox, NULL, addr MsgBoxText, addr MsgBoxCaption, MB_YESNOCANCEL

.if eax==IDYES
        ;Yes button was pressed
		jmp L3
    .elseif eax==IDNO
        ;No button was pressed
    .endif
;popfd

jmp L2

L1:

;Runs this messagebox if equal
invoke MessageBox, NULL, addr MsgBoxText2, addr MsgBoxCaption, MB_YESNOCANCEL
.if eax==IDYES
        ;Yes button was pressed
		jmp L3
    .elseif eax==IDNO
        ;No button was pressed
    .endif
L2:

invoke ExitProcess, NULL
end start 