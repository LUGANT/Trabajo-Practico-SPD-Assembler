.8086
.model small
.stack 100h
jumps ; le dice al tasm que arregle automaticamente los saltos fuera de rango :D
.data

salto db 0dh, 0ah, 24h
txt00 db "Bienvendio al creador de personaje", 0dh, 0ah,24h
txt99 db "Escriba su nombre: ", 24h
credits db "Lucas Antenni",0dh, 0ah
		db "Maximiliano Cidron",0dh, 0ah
		db "Matias Solis", 0dh, 0ah,24h
devolucion db 0dh, 0ah

generobmp db 'img/genero.bmp',0 ; imagen
razabmp db 'img/raza.bmp',0 ; imagen
introbmp db 'img/intro.bmp',0 ; imagen
clasebmp db 'img/clase.bmp',0 ; imagen
ojosgatosbmp db 'img/ojos.bmp',0 ; imagen
tabbmp db 'img/tab.bmp',0
gatoibmp db 'img/gatoi.bmp',0
gatobmp db 'img/gato.bmp',0
menubmp db 'img/menu.bmp',0
muertobmp db 'img/muerto.bmp',0
creditosbmp db 'img/creditos.bmp',0
endbmp db 'img/end.bmp',0

hpp db 00h ;lo ideal es utilizar el valor de la vitalidad para definir los puntos de vida (hp) del jugador
hpe db 0ffh ;
damge db 20
desicion db "000"
; turnos db "OOO", 0dh, 0ah, 24h
; gameover db 'go.bmp',0
; t1   db "atacar - 1", 0dh, 0ah
; 	db "habilidad - 2", 0dh, 0ah
; 	db "hablar - 3", 0dh, 0ah
; 	db "gato - 4", 0dh, 0ah, 24h
t1  db "          1                   2                   3                  4          "    
    db "ษอออออออออออออออออออหอออออออออออออออออออหอออออออออออออออออออหออออออออออออออออออป"
    db "บ      COMBATE      บ       NULO        บ       NULO        บ       NULO       บ" 
    db "ศอออออออออออออออออออสอออออออออออออออออออสอออออออออออออออออออสออออออออออออออออออผ", 0dh, 0ah, 24h
cmb1 db "                    ษอออออออออออออออออออหอออออออออออออออออออป"	, 0dh, 0ah, 24h
msjturnos db "                    บ      Turnos       บ        ",24h
turnos db "OOO"
cmb2 db "        บ", 0dh, 0ah, 24h
vidajugador0 db "                    บ       Su HP       บ      ",24h
vidajugador1 db "-255"
cmb3 db "      บ", 0dh, 0ah, 24h
vidaenemigo0 db "                    บ     HP Enemigo    บ      ",24h
vidaenemigo1 db "-255"
cmb4 db "      บ", 0dh, 0ah, 24h
vidaactualj db "000", 24h
vidaactuale db "000", 24h
cmb5 db "                    ศอออออออออออออออออออสอออออออออออออออออออผ"	, 0dh, 0ah, 24h



.code
extrn regtoascii:proc
extrn readc:proc
extrn printarbmp:proc
extrn Clearscreen:proc
extrn texto:proc
extrn animacionbmp:proc
extrn modovideo:proc
extrn poscursor:proc
extrn guardotexto:proc
extrn personaje:proc
extrn random:proc

main proc
		mov ax, @data
		mov ds, ax

		lea bx, gatobmp
        call printarbmp

menu:
		lea bx, introbmp ; voy a recibir por al lo leido en el teclado
        call printarbmp

again1:
		cmp al, 32h
		je creditos
		cmp al, 33h
		je salir
		cmp al, 31h
		je jugar
		jmp again0

again0:
	mov ah, 08h
	int 21h
	jmp again1


jugar:
		call modovideo; pongo el modo de video 12h 

		mov dx, 1 ; para que lea el texto 1 de la libreria
		call texto
		call Clearscreen
		call modovideo

sicara: ;voy a volver a elegir mi personaje si contesto que no es mi cara

		MOV  DL, 20    ;Columna de pantalla.
		MOV  DH, 10     ;Fila de pantalla.
		call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
	
		lea bx, txt00 ;muevo el offset del texto que quiero imprimir a bx
		int 80h ; llamo la interrupcion que imprime el texto

  		MOV  DL, 20    ;Columna de pantalla.
 		MOV  DH, 11     ;Fila de pantalla.
		call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto

		lea bx, txt99 ;muevo el offset del texto que quiero imprimir a bx
		int 80h ; llamo la interrupcion que imprime el texto

	;GUARDO EL NOMBRE
		mov cx, 1; le indico que quiero guardar el nombre
		call guardotexto; guardo el nombre en la libreria de texto

		
;/////////////////////////////SEXO////////////////////////////////
;cual es tu sexo?
;1 - hombre (0b)
;2 - mujer (1b)

		lea bx, generobmp
        call printarbmp

		;GUARDO EL SEXO
		mov cx, 2; le indico que quiero guardar el sexo
		call guardotexto; guardo el nombre en la libreria de texto

;//////////////////////////////RAZA/////////////////////////////		
;razas, cual es tu raza
;1 - Humano
;2 - orco
;3 - elfo
;4 - carpincho
		

i_raza:

		mov cx, 3; le indico que quiero guardar la raza
		call guardotexto; guardo el nombre en la libreria de texto


;////////////////////////////CLASE////////////////////////////
;1-Guerrero
;2-Asesino
;3-Pistolero
;4-Mago
;5-Clerigo
;6-Paladin
;7-Bardo
;8-Marginado

		mov cx, 4; le indico que quiero guardar la clase
		call guardotexto; guardo el nombre en la libreria de texto

		


	;////////////////////////////estas seguro de que esa es tu cara?////////////////////////////////////////
; 1 = Si
; 2 = No
againsicara:
	lea bx, ojosgatosbmp
    call printarbmp

    cmp al, 31h
    je acto1
	cmp al, 32h ; si elige que no es su cara crea el personaje de vuelta
	je sicara
	jmp againsicara

acto1:

;////////////////////        ACTO I      //////////////////////////////////////////
; EN ESTA PARTE TE DICE LO QUE SOS; EJ; AL PARECER ERES UN HUMANO HOMBRE GUERRERO
;Y VA A IR MOSTRANDO LAS CONERSACIONES Y VAN A APERCER OPCIONES DE COMBATE

    mov dx, 2 ; para que lea el texto 2 de la libreria
	call texto ; en este llamado se guarda tu personajes
	nop
	nop
	nop
	;call personaje ;devuelve por bx el sexo, por cx la raza y por dx la clase




	mov dx, 3 
	call texto

	mov dx, 4
	call texto

	lea bx, tabbmp
	call printarbmp

	mov dx, 5
	call texto

vuelve:
	cmp al, 31h
	je continuar
	mov ah, 08h
	int 21h
	jmp vuelve

continuar:
	mov dx, 6
	call texto
reintentar:
; En este texto te da a alegir entre CONVERSAR O COMBATIR
; La opacion que eliga va a venir por AL
; AL = 1 es conversacion
; AL = 2 es combate

	mov dx, 10 
	call texto 

againbattle:
	cmp al, 31h
	je aconversacion
	cmp al, 32h
	je acombate

	mov ah, 08h
	int 21h
	jmp againbattle

acombate:
	mov dx, 18
	call texto
	call combate
	mov dx, 22
	call texto
;aca deberia ir la batalla de duelo a muerte con dados
	jmp alpueblo

aconversacion:
	mov dx, 11
	call texto
;De vuelta te da a elegir pero ahora 3 opciones	
; AL = 1 es conversacion
; AL = 2 es combate
; AL = 4 es preguntar al gato

againbattle1:
	cmp al, 31h
	je bconversacion
	cmp al, 32h
	je bcombate
	;cmp al,3
	cmp al, 34h
	je apreguntagato

	mov ah, 08h
	int 21h
	jmp againbattle1


bcombate:
	
	mov dx, 20
	call texto
	call combate
	mov dx, 22
	call texto
;aca deberia ir la batalla de duelo a muerte con dados, es la mimsa que acombate, solo que cambia un poco el texto porque aca el gato te dice algo
	jmp alpueblo


bconversacion:
	mov dx, 16
	call texto ;entregas el dinero y listo
	jmp alpueblo

apreguntagato:
	mov dx, 24
	call texto ;entregas el dinero y listo
	jmp bcombate; el gato te hace pelear igual



	
alpueblo:
;muestra el texto del camino al pueblo
	mov dx, 26
	call texto

	lea bx, endbmp ; voy a recibir por al lo leido en el teclado
    call printarbmp

jmp salir

;///FIN ACTO I /////////////
creditos:
	lea bx, creditosbmp
	call printarbmp
	jmp menu

salir:
; de vuelta al modo texto normal
    mov ah, 0
    mov al, 2
    int 10h


mov ax, 4c00h
int 21h
main endp	



;//////////////COMBATE///////////////////////
combate proc
call personaje
mov al, [bx+3]
mov hpp, al
xor bx,bx
xor dx,dx

call modovideo

inicio:

xor ax,ax
mov al, hpp
mov bx, offset vidaactualj 
push ax
push bx
call regtoascii

xor ax,ax
mov al, hpe
mov bx, offset vidaactuale
push ax
push bx
call regtoascii

;mov bl, damge

call clearscreen
call modovideo
MOV  DL, 0   ;Columna de pantalla.
MOV  DH, 10     ;Fila de pantalla.
call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
mov cx, 3
inicio_desicion:	

	
mov ah, 09h
mov dx, offset t1
int 21h

mov ah, 09h
mov dx, offset cmb1
int 21h

mov ah, 09h
mov dx, offset msjturnos
int 21h


mov ah, 09h
mov dx, offset turnos
int 21h

;imprimo la vida
mov ah, 09h
mov dx, offset vidajugador0
int 21h
mov ah, 09h
mov dx, offset vidaactualj
int 21h
mov ah, 09h
mov dx, offset vidajugador1
int 21h
mov dx, offset vidaenemigo0
int 21h
mov ah, 09h
mov dx, offset vidaactuale
int 21h
mov ah, 09h
mov dx, offset vidaenemigo1
int 21h
mov ah, 09h 
mov dx, offset cmb5
int 21h
;termino de imrpimir la vida

cmp cx, 3
je turno0
cmp cx, 2
je turno1
jmp turno2

;PRIMER TURNO_INICIO
turno0:
nop
nop
mov ah, 08h ;elijo cual de las opciones quiero tomar
int 21h

mov turnos[0], 58h


cmp al, 31h
je esataque_0
cmp al, 32h
je eshabiliad_0
cmp al, 33h
je eshablar_0 
cmp al, 34h
je esgato_0
jmp turno0

esataque_0:
add desicion[0], 1
jmp termino_desicion

eshabiliad_0:
add desicion[0], 2
jmp termino_desicion

eshablar_0:
add desicion[0], 3
jmp termino_desicion

esgato_0:
add desicion[0], 4
jmp termino_desicion
;PRIMER TURNO_FIN

;SEGUNDO TURNO_INICIO
turno1:
nop
nop
mov ah, 08h ;elijo cual de las opciones quiero tomar
int 21h

mov turnos[1], 58h

error_1:
cmp al, 31h
je esataque_1
cmp al, 32h
je eshabiliad_1
cmp al, 33h
je eshablar_1 
cmp al, 34h
je esgato_1
jmp turno1

esataque_1:
add desicion[1], 1
jmp termino_desicion

eshabiliad_1:
add desicion[1], 2
jmp termino_desicion

eshablar_1:
add desicion[1], 3
jmp termino_desicion

esgato_1:
add desicion[1], 4
jmp termino_desicion
;SEGUNDO TURNO_FIN

;TERCER TURNO_INICIO
turno2:
nop
nop
mov ah, 08h ;elijo cual de las opciones quiero tomar
int 21h

mov turnos[2], 58h


cmp al, 31h
je esataque_2
cmp al, 32h
je eshabiliad_2
cmp al, 33h
je eshablar_2 
cmp al, 34h
je esgato_2
jmp turno2 

esataque_2:
add desicion[2], 1
jmp termino_desicion

eshabiliad_2:
add desicion[2], 2
jmp termino_desicion

eshablar_2:
add desicion[2], 3
jmp termino_desicion

esgato_2:
add desicion[2], 4
jmp termino_desicion
;TERCER TURNO_FIN
nop
nop
nop
nop
nop
nop
termino_desicion:
call clearscreen
call modovideo
MOV  DL, 0   ;Columna de pantalla.
MOV  DH, 10     ;Fila de pantalla.
call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
nop
nop
loop atajo_inicio

atajo_inicio:
cmp cx, 0
je abajo
jmp inicio_desicion
;fin_desicion:

abajo:
;//REVISO CUALES FUERON LAS DECISIONES
mov cx, 3
inicio_revision:
	cmp cx, 3
	je desicion_0
	cmp cx, 2
	je desicion_1
	jmp desicion_2

;INICIO DESICION_0	
desicion_0:
	cmp desicion[0], 31h
	je doataque_0
	cmp desicion[0], 32h
	je dohabilidad_0
	cmp desicion[0], 33h
	je dohablar_0
	jmp dogato_0
doataque_0:
	call cal_damage_player
	nop
	nop
	cmp hpe, bh
	jb fin0
	sub hpe, bh
	jmp termino_revision
dohabilidad_0:
	jmp termino_revision
dohablar_0:
	jmp termino_revision
dogato_0:
	jmp termino_revision
;FIN DESICION_0

;INICIO DESICION_1
desicion_1:
	cmp desicion[1], 31h
	je doataque_1
	cmp desicion[1], 32h
	je dohabilidad_1
	cmp desicion[1], 33h
	je dohablar_1
	jmp dogato_1
doataque_1:
	call cal_damage_player
	cmp hpe, bh
	jb fin0
	sub hpe, bh
	nop
	nop
	jmp termino_revision
dohabilidad_1:
	jmp termino_revision
dohablar_1:
	jmp termino_revision
dogato_1:
	jmp termino_revision
;FIN DESICION_1

;INCIO DESICION_2
desicion_2:
	cmp desicion[2], 31h
	je doataque_2
	cmp desicion[2], 32h
	je dohabilidad_2
	cmp desicion[2], 33h
	je dohablar_2
	jmp dogato_2
doataque_2:
	call cal_damage_player
	cmp hpe, bh
	jb fin0
	sub hpe, bh
	nop
	nop
	jmp termino_revision
dohabilidad_2:
	jmp termino_revision
dohablar_2:
	jmp termino_revision
dogato_2:
	jmp termino_revision
;FIN DESICION_2

fin0: ;este caso es muy particular, seria en el caso de que la vida que tenga
	 ;el enemigo sea menor que el da?o que va a resivir
	 ;esta hecho con el proposito de evitar overflow
jmp finp

termino_revision:
	nop
	nop
loop atajo_inicio_revision

atajo_inicio_revision:
cmp cx, 0
je condicion_final
jmp inicio_revision
;fin_revision:

condicion_final:
	call cal_damage_enemy
	nop
	nop
	sub hpp, bl
	cmp hpe, 0
	je finp
	cmp hpp, 0
	je fine
	cmp hpe, bh
	jb finp
	cmp hpp, bl
	jb fine	
	mov turnos[0], 4fh
	mov turnos[1], 4fh
	mov turnos[2], 4fh
	mov desicion[0], 30h
	mov desicion[1], 30h
	mov desicion[2], 30h
	call clearscreen
	call modovideo
	MOV  DL, 0   ;Columna de pantalla.
MOV  DH, 10     ;Fila de pantalla.
call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
	jmp inicio
fine: ; te mata el enemigo
	xor dx,dx
	xor bx,bx
	lea bx, muertobmp
	call printarbmp

	cmp al, 31h ;reintentar
	je reintentar
	cmp al, 32h
	je menu
	jmp fine
	ret
finp:
	xor dx, dx
	xor bx,bx

	ret
combate endp

cal_damage_player proc
;tengo que devolver bh el da?o que realiza el personaje
;formula:
; (condicional_random)*((fuerza/10)+(inteligencia/10))
;condicion_random:
;0 -> miss
;1-8 -> ataque
;9 -> crit
push ax
push dx
push cx
xor bx,bx
call personaje ;obtengo em bx el offset de la clase
xor dx,dx

xor ax, ax
mov al, [bx] ;obtengo la fuerza
xor cx, cx
mov cl, 20 
div cl
mov dl, al ;obtengo la fuerza dividida en 10 y lo paso a dh

xor ax, ax

mov al, [bx+2] ;obtengo la inteligencia
xor cx, cx
mov cl, 20
div cl 
;al tiene la inteligencia dividida 10
add dl, al ;obtengo la fuerza dividida en 10 y lo paso a dh

xor ax, ax
mov al, dl
call calculo_tipocritico

pop cx
pop dx
pop ax
ret
cal_damage_player endp

cal_damage_enemy proc
;necesito devolver en bl el da?o que va a realizar el enemigo
push ax
push dx
push cx

mov bl, damge
call random
cmp dl, 0
je miss_damage_enemy
cmp dl, 9
je crit_damage_enemy
jmp normal_damage_enemy

miss_damage_enemy:
mov bl, 0

pop cx
pop dx
pop ax
ret
normal_damage_enemy:

pop cx
pop dx
pop ax
ret
crit_damage_enemy:
mov al, bl
mov bl, 2
mul bl
xor bx,bx
mov bl, al

pop cx
pop dx
pop ax
ret
cal_damage_enemy endp


calculo_tipocritico proc
nop
xor bx,cx
push ax
push dx
push cx

xor dx,dx
mov dl, [bx+1]
cmp dl, 4dh
jbe estipo1
cmp dl, 0bbh
jae estipo2
cmp dl, 0a7h
jae estipo3
jmp estipo4

estipo1:
jmp tipo1
estipo2:
jmp tipo2
estipo3:
jmp tipo3
estipo4:
jmp tipo4

tipo1:
nop
call random
nop
cmp dl, 0
je miss_damage_player_1
cmp dl, 1
je miss_damage_player_1
cmp dl, 9
je crit_damage_player_1
jmp normal_damage_player_1

miss_damage_player_1:
mov bh, 0

pop cx
pop dx
pop ax
ret
normal_damage_player_1:
mov bh, al

pop cx
pop dx
pop ax
ret
crit_damage_player_1:
mov bl, 2
mul bl
xor bx,bx
mov bh, al

pop cx
pop dx
pop ax
ret

tipo2:
nop
call random
nop
cmp dl, 0
je miss_damage_player_2
cmp dl, 7
je crit_damage_player_2
cmp dl, 8
je crit_damage_player_2
cmp dl, 9
je crit_damage_player_2
jmp normal_damage_player_2

miss_damage_player_2:
mov bh, 0

pop cx
pop dx
pop ax
ret
normal_damage_player_2:
mov bh, al

pop cx
pop dx
pop ax
ret
crit_damage_player_2:
mov bl, 2
mul bl
xor bx,bx
mov bh, al

pop cx
pop dx
pop ax
ret

tipo3:
nop
call random
nop
cmp dl, 0
je miss_damage_player_3
cmp dl, 8
je crit_damage_player_2
cmp dl, 9
je crit_damage_player_3
jmp normal_damage_player_3

miss_damage_player_3:
mov bh, 0

pop cx
pop dx
pop ax
ret
normal_damage_player_3:
mov bh, al

pop cx
pop dx
pop ax
ret
crit_damage_player_3:
mov bl, 2
mul bl
xor bx,bx
mov bh, al

pop cx
pop dx
pop ax
ret


tipo4:
nop
call random
nop
cmp dl, 0
je miss_damage_player_0
cmp dl, 9
je crit_damage_player_0
jmp normal_damage_player_0

miss_damage_player_0:
mov bh, 0

pop cx
pop dx
pop ax
ret
normal_damage_player_0:
mov bh, al

pop cx
pop dx
pop ax
ret
crit_damage_player_0:
mov bl, 2
mul bl
xor bx,bx
mov bh, al

pop cx
pop dx
pop ax
ret
calculo_tipocritico endp


end main