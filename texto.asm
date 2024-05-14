.8086
.model small
.stack 100h
jumps ; le dice al tasm que arregle automaticamente los saltos fuera de rango :D
.data
nombre db 255 dup (24h)
sexo db 0b
razas db 00b
clase db 000b
arma db 0
fdivc db "00000" ;([0]-fuerza, [1]-destreza, [2]-inteligencia, [3]-vitalidad, [4]-carisma)
sexoh db 20h,"Hombre",20h, 24h
sexom db 20h,"Mujer",20h, 24h
traza0 db 20h,"Humano,", 24h
traza1 db 20h,"Orco,", 24h
traza2 db 20h,"Elfo,", 24h
traza3 db 20h,"Carpincho,", 24h
tclase0 db "Guerrero                           �", 0dh, 0ah, 24h
tclase1 db "Asesino                    �", 0dh, 0ah, 24h
tclase2 db "Pistolero                          �", 0dh, 0ah, 24h
tclase3 db "Mago                       �", 0dh, 0ah, 24h
tclase4 db "Clerigo                    �", 0dh, 0ah, 24h
tclase5 db "Paladin                    �", 0dh, 0ah, 24h
tclase6 db "Bardo                      �", 0dh, 0ah, 24h
tclase7 db "Marginado                      �", 0dh, 0ah, 24h
tarma0 db  "Espada", 24h
tarma1 db  "cuchilla", 24h
tarma2 db  "pistola", 24h
tarma3 db  "baston magico", 24h
tarma4 db  "tabla de madera", 24h
generobmp db 'img/genero.bmp',0 ; imagen
razabmp db 'img/raza.bmp',0 ; imagen
clasebmp db 'img/clase.bmp',0 ; imagen


 tupersonaje db "������������������������������������������������������������������������������ͻ" 
             db "�          Al parecer eres un", 24h
tupersonajea db "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

menoup1 db  "          1                   2                   3                  4          "    
        db  "������������������������������������������������������������������������������ͻ"
        db  "�   Conversacion    �      NULO         �       NULO        �       NULO       �" 
        db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

menoup2 db  "          1                   2                   3                  4          "    
        db  "������������������������������������������������������������������������������ͻ"
        db  "�   Conversacion    �      COMBATE      �       NULO        �       NULO       �" 
        db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

menoup3 db  "          1                   2                   3                  4          "    
        db  "������������������������������������������������������������������������������ͻ"
        db  "�   Conversacion    �      COMBATE      �       NULO        �Preguntar al gato �" 
        db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h


continuar db 0dh, 0ah
    db  "������������������������������������������������������������������������������ͻ"
    db  "�                        Precione ENTER para continuar                         �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t1  db  "������������������������������������������������������������������������������ͻ"
    db  "�                                                                              �"        
    db  "�               Despiertas con una presi�n sobre tu pecho, sientes             �"
    db  "�                que te falta el aire y los parpados pesados, pero             �"
    db  "�              al sentir una respiraci�n suave en tu cara los abres            �"
    db  "�               para encontrar algo con dos ojos amarillos que te              �"
    db  "�               devuelve la mirada, hasta que tu vista se ajusta a             �"
    db  "�              la poca iluminaci�n y notas que la criatura es un               �"         
    db  "�                      gato, que dorm�a sobre tu pecho.                        �"
    db  "�                                                                              �"
    db  "�               Corres al gato para levantarte, tu memoria est�                �"        
    db  "�              nublada y por instinto empiezas a analizar tu                   �"
    db  "�               alrededor, ves un equipaje que se siente familiar,             �"
    db  "�              la habitaci�n no parece la de una casa, sino la de              �"
    db  "�              una taberna, ruidos desconocidos viniendo de abajo              �"
    db  "�              confirma tu sospecha, ves un espejo con un cuenco de            �"
    db  "�               agua en un rinc�n y decides lavarte el rostro para             �"
    db  "�              intentar recordar como llegaste ah�.                            �"
    db  "�                                                                              �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t2  db  "������������������������������������������������������������������������������ͻ"
    db  "�                                                                              �" 
    db  "�                                                                              �" 
    db  "�           Al terminar te quedas viendo con detenimiento tu cara....          �"
    db  "�                                                                              �" 
    db  "�                                                                              �" 
    db  "�                                                                              �" 
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t3  db  "������������������������������������������������������������������������������ͻ"
    db  "�                                                                              �" 
    db  "�                                                                              �" 
    db  "�               Una voz sale de la nada <Est�s seguro                          �"
    db  "�               de que esa es tu cara?> Te das vuelta de un                    �"
    db  "�               sobresalto, pero lo �nico con vida en la habitaci�n            �"
    db  "�               es el gato que te mira desde la cama desvencijada,             �"
    db  "�               decides ignorarlo, tomar tus cosas y bajar a preguntar         �"
    db  "�               si alguien sabe como llegaste al lugar.                        �"
    db  "�                                                                              �"
    db  "�                                                                              �" 
    db  "�                                                                              �"  
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t4  db  "������������������������������������������������������������������������������ͻ"
    db  "�                                                                              �"  
    db  "�                                                                              �"  
    db  "�              Bajas al primer piso de la taberna para                         �" 
    db  "�              ir directo al tabernero, te sientas en                          �" 
    db  "�              la barra y el tabernero se dirige directo a ti                  �" 
    db  "�                                                                              �"
    db  "�                                                                              �" 
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h
t5  db  "������������������������������������������������������������������������������ͻ"
    db  "�              Tabernero: Noche dif�cil?                                       �" 
    db  "�                                                                              �"
    db  "�              Detonando otro intento fallido por recordar                     �" 
    db  "�              algo, cuando empiezas a pensar m�s                              �" 
    db  "�              notas que no recuerdas nada, sientes familiaridad               �" 
    db  "�              con el tipo de lugar y con tu equipo de viaje, pero             �" 
    db  "�              no hay recuerdos personales.                                    �" 
    db  "�                                                                              �"
    db  "�                                                                              �"    
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h




t6  db  "������������������������������������������������������������������������������ͻ"
    db  "�Donde estamos?                                                                �"
    db  "�                                                                              �"
    db  "�Tabernero: El Carbonero, es la taberna y si te refieres al lugar estamos en   �"
    db  "�el sur del reino, pero ya deber�as saber eso.                                 �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t7  db  "������������������������������������������������������������������������������ͻ"
    db  "�Sonar� extra�o, pero como llegue aqu�?                                        �"
    db  "�                                                                              �"
    db  "�Tabernero: Veo que si fue una noche dif�cil, llegaste hace un par de noches,  �"
    db  "�alquilaste una habitaci�n y no diste m�s informaci�n                          �"
    db  "�como la mayor�a de los que vienen.                                            �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t8  db  "������������������������������������������������������������������������������ͻ"
    db  "�*Recuerdas la voz extra�a*                                                    �"
    db  "�Vine acompa�ado de alguien?                                                   �"
    db  "�                                                                              �"
    db  "�Tabernero: La gente aqu� tiene su privacidad, es un lugar remoto, si tuviste  �"
    db  "�compa��a no lo supe y creo que as� lo esperan todos los que se                �"
    db  "�alojan en mi taberna.                                                         �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t9  db  "������������������������������������������������������������������������������ͻ"
    db  "�*Tu memoria sigue igual de vac�a que antes*                                   �"
    db  "�No dije ni mencione nada en espec�fico durante mi alojamiento?                �"
    db  "�*Te dirige una mirada de desconcierto mayor*                                  �"
    db  "�Tabernero: Solo salias a cenar y no hablabas con nadie, parec�as estar        �"
    db  "�esperando algo, lo �nico que mencionaste la primera noche fue que ven�as      �"
    db  "�para deshacerte de algo.                                                      �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t10 db  "������������������������������������������������������������������������������ͻ"
    db  "�La informaci�n no fue de mucha ayuda, sigues igual de perdido que antes,      �"
    db  "�decides salir de la taberna pensando que ver los alrededores podr�a despertar �"
    db  "�algo en tu memoria de los �ltimos d�as. Tu primera imagen al salir de la      �"
    db  "�taberna es un grupo de cuatro sujetos que parecen estar esperando a alguien.  �"                                                                            
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h
;//////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis conversacion ////////////
;////////////////////////////////////////////////////////// 
t11 db  "������������������������������������������������������������������������������ͻ"
    db  "�Puedo ayudarlos en algo?                                                      �"
    db  "�Sujeto: No lo creo, estamos buscando a alguien que viaja solo.                �"                                                                  
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t12 db  "������������������������������������������������������������������������������ͻ"
    db  "�*Sientes la hostilidad*                                                       �"
    db  "�Bueno cada quien con sus problemas entonces.                                  �"
    db  "�                                                                              �"
    db  "�*Intentas seguir tu camino, pero uno de lo sujeto te detiene, espada en mano* �"
    db  "�Sujeto: La petici�n no era muy espec�fica, solo lugar y d�a, pero sabemos que �"
    db  "�eres el �nico que llego solo.                                                 �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t13 db  "������������������������������������������������������������������������������ͻ"
    db  "�Si soy el objetivo no lo s�, preferir�a seguir mi camino y puedo darles       �"
    db  "�algo a cambio por no preguntar.                                               �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t14 db  "������������������������������������������������������������������������������ͻ"
    db  "�*Sabes que en tu equipaje debe haber una bolsa de dinero, buscas, pero al     �"
    db  "�abrir tu bolsa lo primero que ves son los ojos amarillos del gato mir�ndote   �" 
    db  "�de nuevo y escuchas la misma voz extra�a saliendo del animal*                 �"                                                               
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h


t15 db  "������������������������������������������������������������������������������ͻ"
    db  "�Piensas darles todo? Pelear ser�a la soluci�n r�pida y                        �"
    db  "�para tu bolsillo es mejor as�.                                                �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h


;/////////////////////////////////////////////////////////////////////////   
;////////// Encuentro 1 si elegis conversacion por 2 vez /////////////////
;///////////////////////////////////////////////////////////////////////// 

t16 db  "������������������������������������������������������������������������������ͻ"
    db  "�Ignoras lo que acabas de ver porque te niegas a creer que es real, buscas     �"
    db  "�la bolsa de monedas sin pensarlo demasiado, algo te dice que conseguir m�s no �"
    db  "�ser� dif�cil y se la entregas al que parece el l�der.                         �"                                                  
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t17 db  "������������������������������������������������������������������������������ͻ"
    db  "�Con esto deber�a alcanzar.                                                    �"
    db  "�                                                                              �"
    db  "�*El sujeto pesa la bolsa con la mano, la revisa y te dedica una mirada dif�cil�" 
    db  "�de descifrar, pero notas que le ordena a los dem�s con un movimiento de mano  �"
    db  "�que te dejen seguir tu camino*                                                �"
    db  "�                                                                              �"
    db  "�*Tom�s tu bolsa, notas que el gato te sigue mirando desde dentro, igual       �"
    db  "�vuelves a ignorarlo y sigues tu camino al pueblo.*                            �"                                                          
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

;//////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis Combate//////////////////
;////////////////////////////////////////////////////////// 

t18 db  "������������������������������������������������������������������������������ͻ"
    db  "�instintivamente tomas t� ", 24h
t19 db  " y por primera vez sientes algo     �", 0dh, 0ah
    db  "�familiar, sabes bien como usarla para defenderte o matar.*                    �"                                                               
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t20 db  "������������������������������������������������������������������������������ͻ"
    db  "�La voz del gato hace resonancia en tu mente, instintivamente tomas t�         �", 24h
t21 db  " y por primera vez sientes algo                                      �", 0dh, 0ah
    db  "�familiar, sabes bien como usarla para defenderte o matar.*                    �"                                                               
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t22 db  "������������������������������������������������������������������������������ͻ"
    db  "�*Intentaste no matarlos para no llamar m�s la atenci�n de lo necesario, pero  �"
    db  "�no te dejaron opci�n, ya que ellos iban a matar y por la recompensa, registras�" 
    db  "�sus cosas buscando algo �til, pero solo hay algo de dinero, nada importante.* �"                                                                            
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t23 db  "������������������������������������������������������������������������������ͻ"
    db  "�*A nadie parece importarle la pelea a muerte, decides seguir tu camino hacia  �"
    db  "�el pueblo antes de que alguien haga mas preguntas.*                           �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h


;////////////////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis preguntar al gato//////////////////
;//////////////////////////////////////////////////////////////////// 

t24 db  "������������������������������������������������������������������������������ͻ"
    db  "�Gato: Sabes que la magia no es algo extra�o en el mundo, un animal            �"
    db  "�que habla es algo totalmente nuevo de todas formas.                           �"
    db  "�                                                                              �"
    db  "�Que acabas de decir?                                                          �"
    db  "�                                                                              �"
    db  "�Gato: Tengo repetirlo o sos lento para entender? Sabemos que ganar�as y       �"
    db  "�el dinero es m�s �til que un poco de tranquilidad.                            �"                                                         
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t25 db  "������������������������������������������������������������������������������ͻ"
    db  "�*Tu l�gica que te dice que es una locura hacerle caso a un gato que habla,    �"
    db  "�de todas formas su orden te resulta f�cil de seguir, sin remordimientos.*     �"                         
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

;////////////////////////////////////////////////////////////////////    
;//////////        SECCION DE IR AL PUEBLO        //////////////////
;//////////////////////////////////////////////////////////////////// 

t26 db  "������������������������������������������������������������������������������ͻ"
    db  "�En tu camino al pueblo vuelves a abrir tu bolsa para encontrar al gato        �"
    db  "�durmiendo, intentas despertarlo y hacer que hable de nuevo, para corroborar   �"
    db  "�que lo que paso antes fue real, aunque la criatura solo te ignora.            �"                                                                         
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

ej  db  "������������������������������������������������������������������������������ͻ"
    db  "�                                                                              �"
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t27 db  "������������������������������������������������������������������������������ͻ"
    db  "�Piensas en sacarlo de la bolsa, descartas la idea sin pensarlo mucho, ya que  �"
    db  "�son animales escurridizos y tus prioridades son otras que perseguir un gato   �"
    db  "�parlante, necesitas saber que pasa con tu memoria.                            �"                                                      
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t28 db  "������������������������������������������������������������������������������ͻ"
    db  "�                                   HUMANO                                     �"
    db  "�                                  (NEUTRAL)                                   �"
    db  "�                            fuerza ---------- 127                             �"
    db  "�                            destreza--------- 127                             �"
    db  "�                            inteligencia----- 127                             �"
    db  "�                            vitalidad-------- 127                             �"
    db  "�                            carisma---------- 127                             �"
    db  "�                                                                              �"
    db  "�                            1) aceptar - 2)volver                             �"                                                                      
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h
t29 db  "������������������������������������������������������������������������������ͻ"
    db  "�                                   ELFO                                       �"
    db  "�                    (+INTELIGENCIA +DESTREZA -FUERZA -CARISMA)                �"
    db  "�                            fuerza ---------- 97                              �"
    db  "�                            destreza--------- 147                             �"
    db  "�                            inteligencia----- 157                             �"
    db  "�                            vitalidad-------- 127                             �"
    db  "�                            carisma---------- 107                             �"
    db  "�                                                                              �"
    db  "�                            1) aceptar - 2)volver                             �"                                                                      
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h
t30 db  "������������������������������������������������������������������������������ͻ"
    db  "�                                   ORCO                                       �"
    db  "�                   (+FUERZA +VITALIDAD -DESTREZA -CARISMA)                    �"
    db  "�                            fuerza ---------- 167                             �"
    db  "�                            destreza--------- 97                              �"
    db  "�                            inteligencia----- 127                             �"
    db  "�                            vitalidad-------- 137                             �"
    db  "�                            carisma---------- 107                             �"
    db  "�                                                                              �"
    db  "�                            1) aceptar - 2)volver                             �"                                                                      
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h
t31 db  "������������������������������������������������������������������������������ͻ"
    db  "�                                 CARPINCHO                                    �"
    db  "�                  (-FUERZA -DESTREZA +INTELIGENCIA +CARISMA)                  �"
    db  "�                            fuerza ---------- 97                              �"
    db  "�                            destreza--------- 97                              �"
    db  "�                            inteligencia----- 147                             �"
    db  "�                            vitalidad-------- 127                             �"
    db  "�                            carisma---------- 167                             �" 
    db  "�                                                                              �"
    db  "�                            1) aceptar - 2)volver                             �"                                                                        
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

; t32 db  "������������������������������������������������������������������������������ͻ"
;     db  "�                                                                              �"
;     db  "�                                                                              �"

;     db  "�                                                                              �"
;     db  "�                           +20 fuerza                                         �"
;     db  "�                           +15 vitalidad                                      �"  
;     db  "�                           -10 destreza                                       �"                         
;     db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t33 db  "������������������������������������������������������������������������������ͻ"
    db  "�                             Guerreros                                        �"
    db  "�                                                                              �"
    db  "� forman la primera l�nea de los disciplinados ej�rcitos a lo largo de Reino.  �"
    db  "� Aunque se encuentran m�s com�nmente en culturas con una estructura marcial   �"
    db  "� organizada, los guerreros tambi�n se pueden encontrar como mercenarios       �" 
    db  "� errantes, guardaespaldas y otros tipos de soldados en venta. El elemento     �" 
    db  "� com�n que unifica a los luchadores es su gran enfoque en la resistencia y    �"
    db  "� la defensa cuerpo a cuerpo.                                                  �"
    db  "�                                                                              �"
    db  "�                           +20 fuerza                                         �"
    db  "�                           +15 vitalidad                                      �"
    db  "�                           -10 destreza                                       �"       
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                      
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t34 db  "������������������������������������������������������������������������������ͻ"
    db  "�                             Asesino                                          �"
    db  "�  son despiadados y temidos por la brutalidad de sus ataques. Se pueden       �"
    db  "� encontrar tan a menudo en callejones oscuros como en el coraz�n de las       �"
    db  "� escaramuzas en el campo de batalla. Aunque impredecibles e indisciplinados,  �"
    db  "� los asesinos se usan com�nmente como parte de un asalto sorpresa, sus ataques�" 
    db  "� fulminantes quiebran las filas y la moral del enemigo. Los asesinos tienden a�" 
    db  "� congregarse en mayor n�mero en ciudades donde pueden ser empleados           �"
    db  "� constantemente como mercenarios o sicarios.                                  �"                                                   
    db  "�                           +20 destreza                                       �"                                       
    db  "�                           -10 fuerza                                         �"                      
    db  "�                           +10 inteligencia                                   �" 
    db  "�                           +10 carisma                                        �" 
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"     
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t35 db  "������������������������������������������������������������������������������ͻ"
    db  "�                             Pistolero                                        �"
    db  "�                                                                              �"
    db  "�  son artesanos tecnol�gicamente avanzados e hiperinteligentes. Algunos tienen�"
    db  "�  una influencia incre�ble en el campo de batalla, dando forma a guerras      �"
    db  "� enteras con su valent�a. Algunos son terrores incomparables a corta distancia�"
    db  "�  diezmando a los enemigos con su determinaci�n inquebrantable. Otros son el  �"
    db  "� modelo de eficiencia, acechando y matando a sus objetivos antes de que       �"
    db  "� supieran que hab�a alg�n peligro. Independientemente del m�todo de ataque    �"
    db  "� preferido del pistolero. Todos son formidables por derecho propio. No cruce  �"
    db  "� uno, no deben tomarse a la ligera.                                           �"
    db  "�                                                                              �"
    db  "�                           +40 destreza                                       �"
    db  "�                           +20 carisma                                        �"
    db  "�                           -30 fuerza                                         �"
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                                     
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t36 db  "������������������������������������������������������������������������������ͻ"
    db  "�                              Mago                                            �"
    db  "�                                                                              �"
    db  "� maestros de la magia acad�mica, son estudiantes de tradiciones arcanas que   �"
    db  "� se remontan m�s all� de los l�mites de la historia registrada. Los magos son �"
    db  "� un grupo muy organizado, que a menudo forman academias o gremios dedicados a �"
    db  "� la investigaci�n y el desarrollo de estudios m�gicos, y tienden a favorecer  �"
    db  "� entornos donde se fomenta la investigaci�n, la experimentaci�n, el debate y  �"
    db  "�  la difusi�n del conocimiento.                                               �"
    db  "�                                                                              �"
    db  "�                           +40 intligencia                                    �"
    db  "�                           +20 destreza                                       �"  
    db  "�                           +10 carisma                                        �"                         
    db  "�                           -20 fuerza                                         �"    
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                          
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t37 db  "������������������������������������������������������������������������������ͻ"
    db  "�                            Clerigo                                           �"
    db  "�                                                                              �"
    db  "� son devotos de una deidad y practicantes de la magia religiosa. Si bien      �"
    db  "� todos los cl�rigos se dedican a dioses espec�ficos, el poder de estos en     �"
    db  "� realidad se deriva de sus creencias personales. A diferencia de la mayor�a   �"
    db  "� de los paladines, los cl�rigos tienden a centrarse en la filosof�a, la       �"
    db  "� ense�anza y la relaci�n de las organizaciones religiosas con la gente com�n. �" 
    db  "� La recepci�n que tienen en cualquier parte del mundo depende en gran medida  �"
    db  "� de c�mo la gente que vive all� venera o injuria a su dios.                   �"
    db  "�                                                                              �"
    db  "�                           +40 inteligencia                                   �"
    db  "�                           +20 vitalidad                                      �"  
    db  "�                           -20 fuerza                                         �"  
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                            
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t38 db  "������������������������������������������������������������������������������ͻ"
    db  "�                           Paladin                                            �"
    db  "�                                                                              �"
    db  "� son fan�ticos marciales, devotos de un dios, un gobernante o incluso una     �" 
    db  "� forma de vida. Se pueden encontrar en cualquier cultura donde un grupo       �"
    db  "� fan�tico de individuos de ideas afines haya formado una sociedad guerrera    �"
    db  "� dedicada a promover su causa. Entre los que est�n alineados con su           �"
    db  "� cosmovisi�n, los paladines son vistos con respeto y admiraci�n, aunque con   �"
    db  "� un poco de miedo. Muchos paladines ocupan puestos de liderazgo en ej�rcitos  �"
    db  "� y compa��as mercenarias, pero en el fragor de la batalla, su fanatismo a     �"
    db  "� menudo anula la cadena de mando y el sentido com�n.                          �"
    db  "�                                                                              �"
    db  "�                           +20 fuerza                                         �"
    db  "�                           +20 vitalidad                                      �"  
    db  "�                           +20 inteligencia                                   �"                         
    db  "�                           -20 carisma                                        �"                         
    db  "�                           -30 destreza                                       �"  
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                            
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t39 db  "������������������������������������������������������������������������������ͻ"
    db  "�                            Bardo                                             �"
    db  "�                                                                              �"
    db  "� En todas las culturas del continente, hay Bardos. Muchos historiadores       �"
    db  "� consideran que los bardos son los m�s antiguos trabajadores de la magia, sus �"
    db  "� cantos manipulan la energ�a colectiva de las almas que los rodean,           �"
    db  "� oblig�ndolas a generar efectos m�gicos en una especie de invocacion. En      �"
    db  "� algunas sociedades, los Bardos forman grupos organizados de narradores e     �"
    db  "� investigadores, pero en la mayor parte del mundo son solo una parte de las   �"
    db  "�  tradiciones populares locales.                                              �"
    db  "�                                                                              �"
    db  "�                           +50 carsima                                        �"
    db  "�                           +10 vitalidad                                      �"  
    db  "�                           -20 fuerza                                         �"                         
    db  "�                           -20 destreza                                       �"                         
    db  "�                           -20 inteligencia                                   �" 
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                             
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

t40 db  "������������������������������������������������������������������������������ͻ"
    db  "�                            Marginado                                         �"
    db  "�                                                                              �"
    db  "�            Eres un don nadie. Nunca tuviste que haber existido,              �"
    db  "�            pero de alguna manera de las ingeniaste para poder                �"
    db  "�                       seguir respirando.                                     �"
    db  "�                                                                              �"
    db  "�                           -40 fuerza                                         �"
    db  "�                           -40 destreza                                       �"                         
    db  "�                           -40 inteligencia                                   �"                         
    db  "�                           -40 vitalidad                                      �"  
    db  "�                           -40 carisma                                        �" 
    db  "�                                                                              �"
    db  "�                       1) aceptar - 2)volver                                  �"                        
    db  "������������������������������������������������������������������������������ͼ", 0dh, 0ah, 24h

.code




; voy a recibir por dx el numero de texto que quiero mostrar por pantalla
public texto
public guardotexto
public personaje
extrn poscursor:proc
extrn readc:proc
extrn printarbmp:proc

     texto proc
; IMPRIME UN TEXTO DEL COLOR QUE QUERAMOS
        push dx
        push bx
        pushf


        mov ah, 00h ; modo de video
        mov al, 12h ; modo texto 16 colores, este modo nos permite darle color al fondo y a las letras
        int 10h

;///Asigna color de fondo/borde////
        mov ah, 0bh;
        mov bh, 00h
        mov bl, 0; aca va el color de fondo
        int 10h



        cmp dx, 1
        je txt1
        cmp dx, 2
        je txt2
        cmp dx, 3
        je txt3
        cmp dx, 4
        je txt4
        cmp dx, 5
        je txt5
        cmp dx, 6
        je txt6
        cmp dx, 7
        je txt7
        cmp dx, 8
        je txt8
        cmp dx, 9
        je txt9
        cmp dx, 10
        je txt10
        cmp dx, 11
        je txt11
        cmp dx, 16
        je txt16
        cmp dx, 18
        je txt18
        cmp dx, 20
        je txt20
        cmp dx, 24
        je txt24
        cmp dx, 26
        je txt26
        ; cmp dx, 27
        ; je txt27
        cmp dx, 28
        je txt28
        cmp dx, 29
        je txt29
        cmp dx, 30
        je txt30
        cmp dx, 31
        je txt31
        cmp dx, 33
        je txt33
        cmp dx, 34
        je txt34
        cmp dx, 35
        je txt35
        cmp dx, 36
        je txt36
        cmp dx, 37
        je txt37
        cmp dx, 38
        je txt38
        cmp dx, 39
        je txt39
        cmp dx, 40
        je txt40
        jmp fin


txt1:  
         lea bx, t1
	int 80h
         jmp fin


txt2:   
        MOV  DL, 0    ;Columna de pantalla.
	MOV  DH, 5     ;Fila de pantalla.
	call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
        lea bx, t2
	int 80h

        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        
        lea bx, tupersonaje
        int 80h

;Imprime la raza
        mov bh, 0 ; me aseguro que el valor de bx se el de bl
	mov bl, razas
	push bx
	call fraza

;Imprime el sexo
	cmp sexo, 0b
	je esc_sexo
	lea bx, sexom
	int 80h
	jmp fin_esc_sexo
esc_sexo:
	lea bx, sexoh
	int 80h 
fin_esc_sexo:

;Imprime la clase
        mov bl, clase
	mov bh, 0 ; me aseguro que el valor de bx se el de bl
	push bx
	call fclase

        lea bx, tupersonajea
        int 80h

        jmp fin

txt3:   
        MOV  DL, 0    ;Columna de pantalla.
	MOV  DH, 5     ;Fila de pantalla.
	call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
        lea bx, t3
	int 80h
        jmp fin

txt4:   
        MOV  DL, 0    ;Columna de pantalla.
	MOV  DH, 5     ;Fila de pantalla.
	call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
        lea bx, t4
	int 80h
        jmp fin
        


txt5:  
        MOV  DL, 0    ;Columna de pantalla.
	MOV  DH, 5     ;Fila de pantalla.
	call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
         lea bx, t5
	int 80h
        lea bx, menoup1
	int 80h
        jmp finsincont


txt6:  

        lea bx, t6
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt7:   
        lea bx, t7
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt8:   
        lea bx, t8
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
txt9:   
        lea bx, t9
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        jmp fin

txt10:   
        MOV  DL, 0    ;Columna de pantalla.
	MOV  DH, 5     ;Fila de pantalla.
	call poscursor ; muevo el cursos en la posicion de pantalla donde quiero imprimir el texto
        lea bx, t10
	int 80h
        lea bx, menoup2
	int 80h
        jmp finsincont

txt11:   
        lea bx, t11
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt12:   
        lea bx, t12
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt13:   
        lea bx, t13
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt14:   
        lea bx, t14
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt15:   
        lea bx, t15
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        lea bx, menoup3
	int 80h
        jmp finsincont

txt16:   
        lea bx, t16
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

txt17:   
        lea bx, t17
	int 80h
        jmp fin

txt18:   
        lea bx, t18
	int 80h
        call armaelegida ; me va a imprimir el arma que elegi
        lea bx, t19
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        ; lea bx, t22
	; int 80h
        ; mov ah, 08h ; hago que precione una tecla para continuar
        ; int 21h
        ; lea bx, t23
	; int 80h
        jmp fin

txt20:   
        lea bx, t20
	int 80h
        call armaelegida ; me va a imprimir el arma que elegi
        lea bx, t21
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        jmp fin

; txt22: ; si ganas el combate
;         lea bx, t22
; 	int 80h
;         mov ah, 08h ; hago que precione una tecla para continuar
;         int 21h
;         lea bx, t23
; 	int 80h
;         jmp fin

txt24:
        lea bx, t24
        int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        lea bx, t25
        int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        jmp fin

txt26:
        lea bx, t22
	int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        lea bx, t23
	int 80h

        lea bx, t26
        int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        lea bx, t27
        int 80h
        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h
        jmp fin

txt28:
        lea bx, t28
        int 80h
        jmp finsincont
txt29:
        lea bx, t29
        int 80h
        jmp finsincont
txt30:
        lea bx, t30
        int 80h
        jmp finsincont
txt31:
        lea bx, t31
        int 80h
        jmp finsincont
txt33:
        lea bx, t33
        int 80h
        jmp finsincont
txt34:
        lea bx, t34
        int 80h
        jmp finsincont
txt35:
        lea bx, t35
        int 80h
        jmp finsincont
txt36:
        lea bx, t36
        int 80h
        jmp finsincont
txt37:
        lea bx, t37
        int 80h
        jmp finsincont
txt38:
        lea bx, t38
        int 80h
        jmp finsincont
txt39:
        lea bx, t39
        int 80h
        jmp finsincont
txt40:
        lea bx, t40
        int 80h
        jmp finsincont

fin:
        lea bx, continuar
	int 80h 
        
        

finsincont: ; para cuando no quiera que aparezca el continuar

        mov ah, 08h ; hago que precione una tecla para continuar
        int 21h

        popf
        pop bx
        pop dx

        ret            
     texto endp

guardotexto proc

        cmp cx,1
        je gnombre
        cmp cx,2
        je gsexo
        cmp cx,3
        je graza
        cmp cx,4
        je gclase

gnombre:
        mov ax, 0
	mov bx, 0
	mov dx, offset nombre
	push dx
	push ax
	push bx
	call readc
        ret 

gsexo:   
    cmp al, 31h 
	je eshombre
    cmp al, 32h
    je esmujer

    lea bx, generobmp
    call printarbmp
    jmp gsexo

esmujer:
	mov sexo, 1b ;es mujer
    ret
eshombre:
        ret

graza:

    lea bx, razabmp
    call printarbmp

	cmp al, 31h
	je Humano
	cmp al, 32h
	je Orco
	cmp al, 33h
	je Elfo
	cmp al, 34h
	je Carpincho
    lea bx, razabmp
    call printarbmp
    jmp graza

Humano:
;imprimir texto descriptivo
    mov dx, 28
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verr0
    cmp al, 32h
    je graza
    jmp Humano
verr0:
    mov fdivc[1], 7fh ;127
    mov fdivc[2], 7fh ;127 
    mov fdivc[3], 7fh ;127
    mov fdivc[4], 7fh ;127
    mov fdivc[5], 7fh ;127
	jmp fin_raza

Orco:
;imprimir texto descriptivo
        mov dx, 30
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verr1
    cmp al, 32h
    je graza
    jmp Orco
verr1:
	mov razas, 01b
    mov fdivc[1], 0a7h;167
    mov fdivc[2], 61h ;97
    mov fdivc[3], 7fh ;127
    mov fdivc[4], 89h ;137
    mov fdivc[5], 6bh ;107
	jmp fin_raza

Elfo:
;imprimir texto descriptivo
    mov dx, 29
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verr2
    cmp al, 32h
    je graza
    jmp Elfo
verr2:
	mov razas, 10b
    mov fdivc[1], 61h ;97
    mov fdivc[2], 93h ;147
    mov fdivc[3], 9dh ;157
    mov fdivc[4], 7fh ;127
    mov fdivc[5], 6bh ;107
	jmp fin_raza

Carpincho:
;imprimir texto descriptivo
    mov dx, 31
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verr3
    cmp al, 32h
    je graza
    jmp Carpincho
verr3:
    mov fdivc[1], 61h ;97
    mov fdivc[2], 61h ;97
    mov fdivc[3], 93h ;147
    mov fdivc[4], 7fh ;127
    mov fdivc[5], 0a7h ;167
	mov razas, 11b                

fin_raza:
        ret

gclase:

    lea bx, clasebmp
    call printarbmp

    cmp al, 31h
	je Guerrero
	cmp al, 32h
	je Asesino
	cmp al, 33h
	je Pistolero
	cmp al, 34h
	je Mago
	cmp al, 35h
	je Clerigo
	cmp al, 36h
	je Paladin
	cmp al, 37h
	je Bardo
	cmp al, 38h
	je Marginado
    lea bx, clasebmp
    call printarbmp
	jmp gclase


Guerrero:
;imprimir texto descriptivo
    mov dx, 33
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verc0
    cmp al, 32h
    je gclase
    jmp Guerrero
verc0:
    add fdivc[0], 20
    add fdivc[3], 15
    sub fdivc[1], 10
	jmp fin_clase


Asesino:
;imprimir texto descriptivo
    mov dx, 34
    call texto
;     mov ah, 08h
;     int 21h
    cmp al, 31h
    je verc1
    cmp al, 32h
    je gclase
    jmp Asesino
verc1:
	mov clase, 001b
    add fdivc[1], 20
    add fdivc[2], 10
    add fdivc[4], 10
    sub fdivc[0], 10
    mov arma, 1
	jmp fin_clase


Pistolero:
;imprimir texto descriptivo
    mov dx, 35
    call texto
    cmp al, 31h
    je verc2
    cmp al, 32h
    je gclase
    jmp Pistolero
verc2:
    mov arma, 2
	mov clase, 010b

    add fdivc[1], 40
    add fdivc[4], 20
    sub fdivc[0], 30

	jmp fin_clase

Mago:
    ;imprimir texto descriptivo
    mov dx, 36
    call texto
    cmp al, 31h
    je verc3
    cmp al, 32h
    je gclase
    jmp Mago
verc3:
    mov arma, 3
	mov clase, 011b

    add fdivc[2], 40
    add fdivc[1], 20
    add fdivc[4], 10
    sub fdivc[0], 20
	jmp fin_clase

Clerigo:
    ;imprimir texto descriptivo
    mov dx, 37
    call texto
    cmp al, 31h
    je verc4
    cmp al, 32h
    je gclase
    jmp Clerigo
verc4:
    mov arma, 3
	mov clase, 100b

    add fdivc[2], 40
    add fdivc[3], 20
    sub fdivc[0], 20

	jmp fin_clase

Paladin:
;imprimir texto descriptivo
    mov dx, 38
    call texto
    cmp al, 31h
    je verc5
    cmp al, 32h
    je gclase
    jmp Paladin
verc5:
	mov clase, 101b

    add fdivc[0], 20
    add fdivc[3], 20 
    add fdivc[2], 20
    sub fdivc[4], 20
    sub fdivc[1], 30

	jmp fin_clase

Bardo:
	;imprimir texto descriptivo
    mov dx, 39
    call texto
    cmp al, 31h
    je verc6
    cmp al, 32h
    je gclase
    jmp Bardo
verc6:
    mov clase, 110b

    sub fdivc[0], 20
    sub fdivc[1], 20
    sub fdivc[2], 20
    add fdivc[3], 10
    add fdivc[4], 5

	jmp fin_clase

Marginado:
;imprimir texto descriptivo
    mov dx, 40
    call texto
    cmp al, 31h
    je verc7
    cmp al, 32h
    je gclase
    jmp Marginado
verc7:
    mov arma, 4
	mov clase, 111b

    sub fdivc[0], 40
    sub fdivc[1], 40
    sub fdivc[2], 40
    sub fdivc[3], 40
    sub fdivc[4], 40

fin_clase:
    ret
guardotexto endp


fclase proc
	;utilizo bx para llevar al stack la clase en bin
	push bp
	mov bp, sp
	push ax
	push cx
	push dx
	pushf
	;///

	mov bx, ss:[bp+4]
	cmp bx, 000b
	je esc_guerrero
	cmp bx, 001b
	je esc_asesino
	cmp bx, 010b
	je esc_pistolero
	cmp bx, 011b
	je esc_mago
	cmp bx, 100b
	je esc_clerigo
	cmp bx, 101b
	je esc_paladin
	cmp bx, 110b
	je esc_bardo
	jmp esc_marginado

esc_guerrero:
	mov ah, 09h
	mov dx, offset tclase0
	int 21h
	jmp cfin
esc_asesino:
	mov ah, 09h
	mov dx, offset tclase1
	int 21h
	jmp cfin
esc_pistolero:
	mov ah, 09h
	mov dx, offset tclase2
	int 21h
	jmp cfin
esc_mago:
	mov ah, 09h
	mov dx, offset tclase3
	int 21h
	jmp cfin
esc_clerigo:
	mov ah, 09h
	mov dx, offset tclase4
	int 21h
	jmp cfin
esc_paladin:
	mov ah, 09h
	mov dx, offset tclase5
	int 21h
	jmp cfin
esc_bardo:
	mov ah, 09h
	mov dx, offset tclase6
	int 21h
	jmp cfin
esc_marginado:
	mov ah, 09h
	mov dx, offset tclase7
	int 21h		
cfin:
	;///
	popf
	pop dx
	pop cx
	pop ax
	pop bp
	ret 2

fclase endp
;///////////////////////////////////////////////////////////////////////

;////////////////////////////////////SUBPROCESO RAZA///////////////////
fraza proc
	;utilizo bx para llevar al stack la raza en bin
	push bp
	mov bp, sp
	push ax
	push cx
	push dx
	pushf
	;///

	mov bx, ss:[bp+4]
	cmp bx, 00b
	je esc_humano
	cmp bx, 01b
	je esc_orco
	cmp bx, 10b
	je esc_elfo
	jmp esc_carpincho
esc_humano:

	lea bx, traza0
	int 80h 

	jmp rfin
esc_orco:

	lea bx, traza1
	int 80h 

	jmp rfin
esc_elfo:

	lea bx, traza2
	int 80h 

	jmp rfin
esc_carpincho:

	lea bx, traza3
	int 80h 

rfin:
	;///
	popf
	pop dx
	pop cx
	pop ax
	pop bp
	ret 2
fraza endp

armaelegida proc


     cmp arma, 1
     je cuchilla
     cmp arma, 2
     je pistola
     cmp arma, 3
     je baston  
     cmp arma, 4
     je tabla 
     jmp espada

cuchilla:
        lea bx, tarma1
        int 80h
        ret

pistola:
        lea bx, tarma2
        int 80h
        ret

baston:
        lea bx, tarma3
        int 80h
        ret

tabla:
        lea bx, tarma4
        int 80h
        ret

espada:
        lea bx, tarma0
        int 80h
        ret

armaelegida endp

personaje proc
push ax
push cx
pushf
; devuelve el personajes que elegiste 
; por bx devuelve el sexo
; por cx la raza
; por dx la clase

;        cmp sexo, 0
;        je phombre
;        mov bx, 1 ;mando que es mujer
;        jmp praza
;phombre:
;        mov bx, 0 ;mando que es hombre
;        jmp praza
;praza:
;        cmp razas, 0
;        je  phumano
;        cmp razas, 1
;        je  porco
;        cmp razas, 2
;        je  pelfo
;        mov cx, 3 ; mando que es carpincho
;        jmp pclase

;phumano:
;        mov cx, 0
;        jmp pclase
;porco:
;        mov cx, 1
;        jmp pclase
;pelfo:
;        mov cx, 2
;        jmp pclase
;
pclase:
        cmp clase, 0
        je pguerreo
        cmp clase, 1
        je  pasesino
        cmp clase, 2
        je  ppistolero
        cmp clase, 3
        je pmago
        cmp clase, 4
        je pclerigo
        cmp clase, 5
        je ppaladin
        cmp clase, 6
        je pbardo
        mov dx, 7; le digo que es marginado
        jmp personajefin

pguerreo:
        mov dx, 0
        jmp personajefin

pasesino:
        mov dx, 1
        jmp personajefin

ppistolero:
        mov dx, 2
        jmp personajefin

pmago:
        mov dx, 3
        jmp personajefin

pclerigo:
        mov dx, 4
        jmp personajefin

ppaladin:
        mov dx, 5
        jmp personajefin

pbardo:
        mov dx, 6
        jmp personajefin


personajefin:
mov bx, offset fdivc
popf
pop cx
pop ax
ret
personaje endp


end 

