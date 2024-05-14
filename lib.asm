.8086
.model small
.stack 100h
.data

filehandle dw ? ;para el printbmp

Header db 54 dup (0) ;para el printbmp

Palette db 256*4 dup (0) ;para el printbmp

ScrLine db 320 dup (0) ;para el printbmp
 
ErrorMsg db 'Error', 13, 10,'$' ;para el printbmp

.code

public regtoascii ;utiliza reg AX y BX [l.11]
public asciitoreg ;utiliza reg AX y BX [l.50]
public readc
public printarbmp ;utiliza reg BX
public Clearscreen
public modovideo
public poscursor
public random
;public printc
;------------------------------REGTOASCII---------------------------------------
;utilizo ax como registro que posee el numero que quiero
;convertir.
;utilizo bx para almacenar el offset de num
regtoascii proc 
	push bp
	mov bp, sp
	push cx
	push si
	pushf

	mov al, ss:[bp+6];pasando el valor del stack (el numreg en ax) a ax
	mov bx, ss:[bp+4];paso el offset de la var a bx por stack
	mov cl, 100 ;utilizo cl para la division, empiezo con 100
	div cl ;divido
	add al, 30h ;le sumo 30h (distancia al 0 de ascii)
	mov byte ptr [bx],al ;guardo el cociente en la variable 
	;GENERO CENTENA
	
	mov al, ah ; paso el resto a al
	xor ah, ah ; limpio ah para que no rompa todo
	mov cl, 10 ; pongo 10 en cl para hacer la decena
	div cl     
	add al, 30h
	mov byte ptr [bx+1], al
	;GENERO DECENA 
	
	add ah, 30h
	mov byte ptr [bx+2],ah	
	;GENERO UNIDAD

	popf
	pop si
	pop cx
	pop bp
ret 4
regtoascii endp
;================================================================================================================================
;================================================================================================================================
;--------------------------------ASCIITOREG(para 3 digitos)--------------------------------------
;utiliza los resgistros bx y ax
;ax del stack almacena el numero en ascii
;bx del stack es donde se deposita o almacena el valor en reg
asciitoreg proc
	push bp
	mov bp, sp
	push cx
	push dx
	push si
	pushf
	mov bx, ss:[bp+6]
	xor dx,dx

	mov al, byte ptr [bx] ;GUARDO EL DIGITO ASCII MAS SIGNIFICATIVO EN AL
	sub al, 30h    ;CONVIERTO ESE DATO A NRO
	mov cl, 100    ;GUARDO EN CL LA CANTIDAD PARA MULTIPLICAR
	mul cl         ;MULTIPLICO
	add dl, al     ;GUARDO EL RESULTADO

	;CONSIGO DECENA
	mov al,  byte ptr [bx+1]
	sub al, 30h
	mov cl, 10
	mul cl
	add dl, al 

	;CONSIGO UNIDAD
	mov al, byte ptr [bx+2]
	sub al, 30h
	add dl, al
	mov bx, ss:[bp+4]
	mov byte ptr[bx], dl
	;guardo el valor de dl en la variable

	popf
	pop si
	pop dx
	pop cx
	pop bp
ret 4
asciitoreg endp
;================================================================================================================================
;================================================================================================================================
;-------------------------READC(hasta 255)------------------------------
readc proc
;utilizamos variables bx y ax para pasarlos por el stack
;orden de push en main -> 1ø dx(ss:[bp+8]), 2ø ax(ss:[bp+6]), 3øbx(ss:[bp+4])
;bx tendra el MODO de la funcion readc, esta puede ser:
; 0 - INDEFINIDO
; 1 - DEFINIDO 
;ax tendra los PARAMETROS de cada MODO 
; MODO 0:
; 0 - cortaa con 0dh
; 1 - corta con 24h
; !0 && !1 - corta con aquel valor puesto en ax, distinto de 0  y 1
; MODO 1:
; DINIDO POR AX - ax definira la cantidad de caracteres que leera
;dx sera el registro en el stack que posee el offset de la variable de texto
;dentro de la funcion bx del stack va a ser ah, y ax del stack va a ser al
rc_arriba:
		push bp
		mov bp, sp
		push ax
		push bx
		push cx
		push dx
		push si

		xor cx, cx
		mov bx, ss:[bp+8] ;paso el dx del stack (offset del texto) a bx
		mov si, bx
		add si, 255
		mov ah, ss:[bp+4]
		mov al, ss:[bp+6]
		cmp ah, 0
		je modo0
		mov cl, al ;aca empieza el definido, poniendo en cl ss:[bp+6]
carga:	
		mov ah, 1
		int 21h
		mov byte ptr [bx], al
		inc bx
		loop carga
		jmp finLectura
modo0: 
		cmp al, 0
		je finEnter
		cmp al, 1
		je finPesos
		mov dl, al
		jmp continuar
finEnter:
		mov dl, 0dh
		jmp continuar
finPesos:
		mov dl, 24h
		jmp continuar
continuar:
		mov ah, 1
		int 21h
		cmp al, dl
		je finLectura
		cmp bx, si
		je finLectura
		mov [bx], al
		inc bx
		jmp continuar
finlectura:
		pop si
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		ret 6

readc endp
;================================================================================================================================
;================================================================================================================================
;----------------------WRITEC-------------------------------
printc proc

		;RECIBE EN BX EL OFFSET DE UNA VARIALBE DB E IMPRIME CARACTER A CARACTER HASTA ENCONTRAR UN $
		push ax
		push dx

	arriba:
		cmp byte ptr [bx], 24h
		je fin
		mov ah, 2
		mov dl, byte ptr [bx]
		int 21h
		inc bx
		jmp arriba 

	fin:
		pop dx
		pop ax
		ret 2
printc endp
;================================================================================================================================
;================================================================================================================================
printarbmp proc 
;	recibo por bx la imagen que quiero imprimir
;	devuelvo por al la opcione que seleccione

    ; Graphic mode
    mov ax, 13h
    int 10h

    ; Process BMP file
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

    ; Wait for key press
    mov ah,1
    int 21h
	push ax
    ; Back to text mode
    mov ah, 0
    mov al, 2
    int 10h
	pop ax
    ret

printarbmp endp 
proc OpenFile

    ; Open file

    mov ah, 3Dh
    xor al, al
    mov dx, offset bx
    int 21h

    jc openerror
    mov [filehandle], ax
    ret

    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
endp OpenFile
proc ReadHeader

    ; Read BMP file header, 54 bytes

    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
    endp ReadHeader
    proc ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)

    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
endp ReadPalette
proc CopyPal

    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h

    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copy starting color to port 3C8h

    out dx,al

    ; Copy palette itself to port 3C9h

    inc dx
    PalLoop:

    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.

    mov al,[si+2] ; Get red value.
    shr al,2 ; Max. is 255, but video palette maximal

    ; value is 63. Therefore dividing by 4.

    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,2
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,2
    out dx,al ; Send it.
    add si,4 ; Point to next color.

    ; (There is a null chr. after every color.)

    loop PalLoop
    ret
endp CopyPal

proc CopyBitmap

    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.

    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, point to the correct screen line

    mov di,cx
    shl cx,6
    shl di,8
    add di,cx

    ; Read one line

    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    ;add dx,0
    int 21h

    ; Copy one line into video memory

    cld 

    ; Clear direction flag, for movsb

    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    ; Copy line to the screen
    ;rep movsb is same as the following code:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0

    pop cx
    loop PrintBMPLoop
    ret
endp CopyBitmap
;================================================================================================================================
;================================================================================================================================
proc Clearscreen
	push ax
	push es
	push cx
	push di
	mov ax,3
	int 10h
	mov ax,0b800h
	mov es,ax
	mov cx,1000
	mov ax,7
	mov di,ax
	cld
	rep stosw
	pop di
	pop cx
	pop es
	pop ax
	ret 
Clearscreen endp
;================================================================================================================================
;================================================================================================================================
modovideo proc
    push ax
    push bx

    mov ah, 00h ; modo de video
    mov al, 12h ; modo grafico 640x480 16 colores
    int 10h

;///Asigna color de fondo/borde////
    mov ah, 0bh;
    mov bh, 00h
    mov bl, 0; aca va el color de fondo
    int 10h

	pop bx
	pop ax
	ret
modovideo endp
;================================================================================================================================
;================================================================================================================================
poscursor proc
;Posicione el cursor donde quiera que aparezca el texto en pantalla
;Recive por DL la columna y por DH la fila
push ax
push bx

;   MOV  DL, 20    ;Columna.
;   MOV  DH, 5     ;Pantalla.
  MOV  AH, 2     ;Servicio para posicionar el cursor
  MOV  BH, 0     ;Numero de pagina
  INT  10H

  pop bx
  pop ax       
ret
poscursor endp
;================================================================================================================================
;================================================================================================================================
random proc
push ax
push bx
push cx

   mov ah, 00h  ; trae la hora del sistema      
   int 1ah      ; CX:DX ahora guarda los ticks del reloj

   mov  ax, dx
   xor  dx, dx
   mov  cx, 10    
   div  cx       ; ahora dx contiene el resto de  la division - del 0 al 9

pop cx
pop bx
pop ax
   ret
random endp
end












