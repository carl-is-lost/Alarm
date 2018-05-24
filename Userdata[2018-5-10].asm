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
				db "Second line of text",13,10
				db "Third line of text",13,10
				db "Last line here",0
Line1	db "username: ",0
Line2	db ?
Line3	db "test",0

.code
start:

;mov eax,Line1

invoke MessageBox, NULL, addr MsgBoxText, addr MsgBoxCaption, MB_OKCANCEL
invoke ExitProcess, NULL
end start 