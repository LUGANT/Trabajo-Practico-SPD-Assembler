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
tclase0 db "Guerrero                           บ", 0dh, 0ah, 24h
tclase1 db "Asesino                    บ", 0dh, 0ah, 24h
tclase2 db "Pistolero                          บ", 0dh, 0ah, 24h
tclase3 db "Mago                       บ", 0dh, 0ah, 24h
tclase4 db "Clerigo                    บ", 0dh, 0ah, 24h
tclase5 db "Paladin                    บ", 0dh, 0ah, 24h
tclase6 db "Bardo                      บ", 0dh, 0ah, 24h
tclase7 db "Marginado                      บ", 0dh, 0ah, 24h
tarma0 db  "Espada", 24h
tarma1 db  "cuchilla", 24h
tarma2 db  "pistola", 24h
tarma3 db  "baston magico", 24h
tarma4 db  "tabla de madera", 24h
generobmp db 'img/genero.bmp',0 ; imagen
razabmp db 'img/raza.bmp',0 ; imagen
clasebmp db 'img/clase.bmp',0 ; imagen


 tupersonaje db "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป" 
             db "บ          Al parecer eres un", 24h
tupersonajea db "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

menoup1 db  "          1                   2                   3                  4          "    
        db  "ษอออออออออออออออออออหอออออออออออออออออออหอออออออออออออออออออหออออออออออออออออออป"
        db  "บ   Conversacion    บ      NULO         บ       NULO        บ       NULO       บ" 
        db  "ศอออออออออออออออออออสอออออออออออออออออออสอออออออออออออออออออสออออออออออออออออออผ", 0dh, 0ah, 24h

menoup2 db  "          1                   2                   3                  4          "    
        db  "ษอออออออออออออออออออหอออออออออออออออออออหอออออออออออออออออออหออออออออออออออออออป"
        db  "บ   Conversacion    บ      COMBATE      บ       NULO        บ       NULO       บ" 
        db  "ศอออออออออออออออออออสอออออออออออออออออออสอออออออออออออออออออสออออออออออออออออออผ", 0dh, 0ah, 24h

menoup3 db  "          1                   2                   3                  4          "    
        db  "ษอออออออออออออออออออหอออออออออออออออออออหอออออออออออออออออออหออออออออออออออออออป"
        db  "บ   Conversacion    บ      COMBATE      บ       NULO        บPreguntar al gato บ" 
        db  "ศอออออออออออออออออออสอออออออออออออออออออสอออออออออออออออออออสออออออออออออออออออผ", 0dh, 0ah, 24h


continuar db 0dh, 0ah
    db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                        Precione ENTER para continuar                         บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t1  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                                                              บ"        
    db  "บ               Despiertas con una presiขn sobre tu pecho, sientes             บ"
    db  "บ                que te falta el aire y los parpados pesados, pero             บ"
    db  "บ              al sentir una respiraciขn suave en tu cara los abres            บ"
    db  "บ               para encontrar algo con dos ojos amarillos que te              บ"
    db  "บ               devuelve la mirada, hasta que tu vista se ajusta a             บ"
    db  "บ              la poca iluminaciขn y notas que la criatura es un               บ"         
    db  "บ                      gato, que dormกa sobre tu pecho.                        บ"
    db  "บ                                                                              บ"
    db  "บ               Corres al gato para levantarte, tu memoria est                 บ"        
    db  "บ              nublada y por instinto empiezas a analizar tu                   บ"
    db  "บ               alrededor, ves un equipaje que se siente familiar,             บ"
    db  "บ              la habitaciขn no parece la de una casa, sino la de              บ"
    db  "บ              una taberna, ruidos desconocidos viniendo de abajo              บ"
    db  "บ              confirma tu sospecha, ves un espejo con un cuenco de            บ"
    db  "บ               agua en un rincขn y decides lavarte el rostro para             บ"
    db  "บ              intentar recordar como llegaste ahก.                            บ"
    db  "บ                                                                              บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t2  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                                                              บ" 
    db  "บ                                                                              บ" 
    db  "บ           Al terminar te quedas viendo con detenimiento tu cara....          บ"
    db  "บ                                                                              บ" 
    db  "บ                                                                              บ" 
    db  "บ                                                                              บ" 
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t3  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                                                              บ" 
    db  "บ                                                                              บ" 
    db  "บ               Una voz sale de la nada <Est s seguro                          บ"
    db  "บ               de que esa es tu cara?> Te das vuelta de un                    บ"
    db  "บ               sobresalto, pero lo ฃnico con vida en la habitaciขn            บ"
    db  "บ               es el gato que te mira desde la cama desvencijada,             บ"
    db  "บ               decides ignorarlo, tomar tus cosas y bajar a preguntar         บ"
    db  "บ               si alguien sabe como llegaste al lugar.                        บ"
    db  "บ                                                                              บ"
    db  "บ                                                                              บ" 
    db  "บ                                                                              บ"  
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t4  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                                                              บ"  
    db  "บ                                                                              บ"  
    db  "บ              Bajas al primer piso de la taberna para                         บ" 
    db  "บ              ir directo al tabernero, te sientas en                          บ" 
    db  "บ              la barra y el tabernero se dirige directo a ti                  บ" 
    db  "บ                                                                              บ"
    db  "บ                                                                              บ" 
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h
t5  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ              Tabernero: Noche difกcil?                                       บ" 
    db  "บ                                                                              บ"
    db  "บ              Detonando otro intento fallido por recordar                     บ" 
    db  "บ              algo, cuando empiezas a pensar m s                              บ" 
    db  "บ              notas que no recuerdas nada, sientes familiaridad               บ" 
    db  "บ              con el tipo de lugar y con tu equipo de viaje, pero             บ" 
    db  "บ              no hay recuerdos personales.                                    บ" 
    db  "บ                                                                              บ"
    db  "บ                                                                              บ"    
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h




t6  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บDonde estamos?                                                                บ"
    db  "บ                                                                              บ"
    db  "บTabernero: El Carbonero, es la taberna y si te refieres al lugar estamos en   บ"
    db  "บel sur del reino, pero ya deberกas saber eso.                                 บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t7  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บSonar  extraคo, pero como llegue aquก?                                        บ"
    db  "บ                                                                              บ"
    db  "บTabernero: Veo que si fue una noche difกcil, llegaste hace un par de noches,  บ"
    db  "บalquilaste una habitaciขn y no diste m s informaciขn                          บ"
    db  "บcomo la mayorกa de los que vienen.                                            บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t8  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Recuerdas la voz extraคa*                                                    บ"
    db  "บVine acompaคado de alguien?                                                   บ"
    db  "บ                                                                              บ"
    db  "บTabernero: La gente aquก tiene su privacidad, es un lugar remoto, si tuviste  บ"
    db  "บcompaคกa no lo supe y creo que asก lo esperan todos los que se                บ"
    db  "บalojan en mi taberna.                                                         บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t9  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Tu memoria sigue igual de vacกa que antes*                                   บ"
    db  "บNo dije ni mencione nada en especกfico durante mi alojamiento?                บ"
    db  "บ*Te dirige una mirada de desconcierto mayor*                                  บ"
    db  "บTabernero: Solo salias a cenar y no hablabas con nadie, parecกas estar        บ"
    db  "บesperando algo, lo ฃnico que mencionaste la primera noche fue que venกas      บ"
    db  "บpara deshacerte de algo.                                                      บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t10 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บLa informaciขn no fue de mucha ayuda, sigues igual de perdido que antes,      บ"
    db  "บdecides salir de la taberna pensando que ver los alrededores podrกa despertar บ"
    db  "บalgo en tu memoria de los ฃltimos dกas. Tu primera imagen al salir de la      บ"
    db  "บtaberna es un grupo de cuatro sujetos que parecen estar esperando a alguien.  บ"                                                                            
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h
;//////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis conversacion ////////////
;////////////////////////////////////////////////////////// 
t11 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บPuedo ayudarlos en algo?                                                      บ"
    db  "บSujeto: No lo creo, estamos buscando a alguien que viaja solo.                บ"                                                                  
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t12 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Sientes la hostilidad*                                                       บ"
    db  "บBueno cada quien con sus problemas entonces.                                  บ"
    db  "บ                                                                              บ"
    db  "บ*Intentas seguir tu camino, pero uno de lo sujeto te detiene, espada en mano* บ"
    db  "บSujeto: La peticiขn no era muy especกfica, solo lugar y dกa, pero sabemos que บ"
    db  "บeres el ฃnico que llego solo.                                                 บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t13 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บSi soy el objetivo no lo s, preferirกa seguir mi camino y puedo darles       บ"
    db  "บalgo a cambio por no preguntar.                                               บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t14 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Sabes que en tu equipaje debe haber una bolsa de dinero, buscas, pero al     บ"
    db  "บabrir tu bolsa lo primero que ves son los ojos amarillos del gato mir ndote   บ" 
    db  "บde nuevo y escuchas la misma voz extraคa saliendo del animal*                 บ"                                                               
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h


t15 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บPiensas darles todo? Pelear serกa la soluciขn r pida y                        บ"
    db  "บpara tu bolsillo es mejor asก.                                                บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h


;/////////////////////////////////////////////////////////////////////////   
;////////// Encuentro 1 si elegis conversacion por 2 vez /////////////////
;///////////////////////////////////////////////////////////////////////// 

t16 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บIgnoras lo que acabas de ver porque te niegas a creer que es real, buscas     บ"
    db  "บla bolsa de monedas sin pensarlo demasiado, algo te dice que conseguir m s no บ"
    db  "บser  difกcil y se la entregas al que parece el lกder.                         บ"                                                  
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t17 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บCon esto deberกa alcanzar.                                                    บ"
    db  "บ                                                                              บ"
    db  "บ*El sujeto pesa la bolsa con la mano, la revisa y te dedica una mirada difกcilบ" 
    db  "บde descifrar, pero notas que le ordena a los dem s con un movimiento de mano  บ"
    db  "บque te dejen seguir tu camino*                                                บ"
    db  "บ                                                                              บ"
    db  "บ*Tom s tu bolsa, notas que el gato te sigue mirando desde dentro, igual       บ"
    db  "บvuelves a ignorarlo y sigues tu camino al pueblo.*                            บ"                                                          
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

;//////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis Combate//////////////////
;////////////////////////////////////////////////////////// 

t18 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บinstintivamente tomas tฃ ", 24h
t19 db  " y por primera vez sientes algo     บ", 0dh, 0ah
    db  "บfamiliar, sabes bien como usarla para defenderte o matar.*                    บ"                                                               
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t20 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บLa voz del gato hace resonancia en tu mente, instintivamente tomas tฃ         บ", 24h
t21 db  " y por primera vez sientes algo                                      บ", 0dh, 0ah
    db  "บfamiliar, sabes bien como usarla para defenderte o matar.*                    บ"                                                               
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t22 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Intentaste no matarlos para no llamar m s la atenciขn de lo necesario, pero  บ"
    db  "บno te dejaron opciขn, ya que ellos iban a matar y por la recompensa, registrasบ" 
    db  "บsus cosas buscando algo ฃtil, pero solo hay algo de dinero, nada importante.* บ"                                                                            
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t23 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*A nadie parece importarle la pelea a muerte, decides seguir tu camino hacia  บ"
    db  "บel pueblo antes de que alguien haga mas preguntas.*                           บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h


;////////////////////////////////////////////////////////////////////    
;////////// Encuentro 1 si elegis preguntar al gato//////////////////
;//////////////////////////////////////////////////////////////////// 

t24 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บGato: Sabes que la magia no es algo extraคo en el mundo, un animal            บ"
    db  "บque habla es algo totalmente nuevo de todas formas.                           บ"
    db  "บ                                                                              บ"
    db  "บQue acabas de decir?                                                          บ"
    db  "บ                                                                              บ"
    db  "บGato: Tengo repetirlo o sos lento para entender? Sabemos que ganarกas y       บ"
    db  "บel dinero es m s ฃtil que un poco de tranquilidad.                            บ"                                                         
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t25 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ*Tu lขgica que te dice que es una locura hacerle caso a un gato que habla,    บ"
    db  "บde todas formas su orden te resulta f cil de seguir, sin remordimientos.*     บ"                         
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

;////////////////////////////////////////////////////////////////////    
;//////////        SECCION DE IR AL PUEBLO        //////////////////
;//////////////////////////////////////////////////////////////////// 

t26 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บEn tu camino al pueblo vuelves a abrir tu bolsa para encontrar al gato        บ"
    db  "บdurmiendo, intentas despertarlo y hacer que hable de nuevo, para corroborar   บ"
    db  "บque lo que paso antes fue real, aunque la criatura solo te ignora.            บ"                                                                         
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

ej  db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                                                              บ"
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t27 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บPiensas en sacarlo de la bolsa, descartas la idea sin pensarlo mucho, ya que  บ"
    db  "บson animales escurridizos y tus prioridades son otras que perseguir un gato   บ"
    db  "บparlante, necesitas saber que pasa con tu memoria.                            บ"                                                      
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t28 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                   HUMANO                                     บ"
    db  "บ                                  (NEUTRAL)                                   บ"
    db  "บ                            fuerza ---------- 127                             บ"
    db  "บ                            destreza--------- 127                             บ"
    db  "บ                            inteligencia----- 127                             บ"
    db  "บ                            vitalidad-------- 127                             บ"
    db  "บ                            carisma---------- 127                             บ"
    db  "บ                                                                              บ"
    db  "บ                            1) aceptar - 2)volver                             บ"                                                                      
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h
t29 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                   ELFO                                       บ"
    db  "บ                    (+INTELIGENCIA +DESTREZA -FUERZA -CARISMA)                บ"
    db  "บ                            fuerza ---------- 97                              บ"
    db  "บ                            destreza--------- 147                             บ"
    db  "บ                            inteligencia----- 157                             บ"
    db  "บ                            vitalidad-------- 127                             บ"
    db  "บ                            carisma---------- 107                             บ"
    db  "บ                                                                              บ"
    db  "บ                            1) aceptar - 2)volver                             บ"                                                                      
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h
t30 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                   ORCO                                       บ"
    db  "บ                   (+FUERZA +VITALIDAD -DESTREZA -CARISMA)                    บ"
    db  "บ                            fuerza ---------- 167                             บ"
    db  "บ                            destreza--------- 97                              บ"
    db  "บ                            inteligencia----- 127                             บ"
    db  "บ                            vitalidad-------- 137                             บ"
    db  "บ                            carisma---------- 107                             บ"
    db  "บ                                                                              บ"
    db  "บ                            1) aceptar - 2)volver                             บ"                                                                      
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h
t31 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                                 CARPINCHO                                    บ"
    db  "บ                  (-FUERZA -DESTREZA +INTELIGENCIA +CARISMA)                  บ"
    db  "บ                            fuerza ---------- 97                              บ"
    db  "บ                            destreza--------- 97                              บ"
    db  "บ                            inteligencia----- 147                             บ"
    db  "บ                            vitalidad-------- 127                             บ"
    db  "บ                            carisma---------- 167                             บ" 
    db  "บ                                                                              บ"
    db  "บ                            1) aceptar - 2)volver                             บ"                                                                        
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

; t32 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
;     db  "บ                                                                              บ"
;     db  "บ                                                                              บ"

;     db  "บ                                                                              บ"
;     db  "บ                           +20 fuerza                                         บ"
;     db  "บ                           +15 vitalidad                                      บ"  
;     db  "บ                           -10 destreza                                       บ"                         
;     db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t33 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                             Guerreros                                        บ"
    db  "บ                                                                              บ"
    db  "บ forman la primera lกnea de los disciplinados ejrcitos a lo largo de Reino.  บ"
    db  "บ Aunque se encuentran m s comฃnmente en culturas con una estructura marcial   บ"
    db  "บ organizada, los guerreros tambin se pueden encontrar como mercenarios       บ" 
    db  "บ errantes, guardaespaldas y otros tipos de soldados en venta. El elemento     บ" 
    db  "บ comฃn que unifica a los luchadores es su gran enfoque en la resistencia y    บ"
    db  "บ la defensa cuerpo a cuerpo.                                                  บ"
    db  "บ                                                                              บ"
    db  "บ                           +20 fuerza                                         บ"
    db  "บ                           +15 vitalidad                                      บ"
    db  "บ                           -10 destreza                                       บ"       
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                      
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t34 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                             Asesino                                          บ"
    db  "บ  son despiadados y temidos por la brutalidad de sus ataques. Se pueden       บ"
    db  "บ encontrar tan a menudo en callejones oscuros como en el corazขn de las       บ"
    db  "บ escaramuzas en el campo de batalla. Aunque impredecibles e indisciplinados,  บ"
    db  "บ los asesinos se usan comฃnmente como parte de un asalto sorpresa, sus ataquesบ" 
    db  "บ fulminantes quiebran las filas y la moral del enemigo. Los asesinos tienden aบ" 
    db  "บ congregarse en mayor nฃmero en ciudades donde pueden ser empleados           บ"
    db  "บ constantemente como mercenarios o sicarios.                                  บ"                                                   
    db  "บ                           +20 destreza                                       บ"                                       
    db  "บ                           -10 fuerza                                         บ"                      
    db  "บ                           +10 inteligencia                                   บ" 
    db  "บ                           +10 carisma                                        บ" 
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"     
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t35 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                             Pistolero                                        บ"
    db  "บ                                                                              บ"
    db  "บ  son artesanos tecnolขgicamente avanzados e hiperinteligentes. Algunos tienenบ"
    db  "บ  una influencia increกble en el campo de batalla, dando forma a guerras      บ"
    db  "บ enteras con su valentกa. Algunos son terrores incomparables a corta distanciaบ"
    db  "บ  diezmando a los enemigos con su determinaciขn inquebrantable. Otros son el  บ"
    db  "บ modelo de eficiencia, acechando y matando a sus objetivos antes de que       บ"
    db  "บ supieran que habกa algฃn peligro. Independientemente del mtodo de ataque    บ"
    db  "บ preferido del pistolero. Todos son formidables por derecho propio. No cruce  บ"
    db  "บ uno, no deben tomarse a la ligera.                                           บ"
    db  "บ                                                                              บ"
    db  "บ                           +40 destreza                                       บ"
    db  "บ                           +20 carisma                                        บ"
    db  "บ                           -30 fuerza                                         บ"
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                                     
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t36 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                              Mago                                            บ"
    db  "บ                                                                              บ"
    db  "บ maestros de la magia acadmica, son estudiantes de tradiciones arcanas que   บ"
    db  "บ se remontan m s all  de los lกmites de la historia registrada. Los magos son บ"
    db  "บ un grupo muy organizado, que a menudo forman academias o gremios dedicados a บ"
    db  "บ la investigaciขn y el desarrollo de estudios m gicos, y tienden a favorecer  บ"
    db  "บ entornos donde se fomenta la investigaciขn, la experimentaciขn, el debate y  บ"
    db  "บ  la difusiขn del conocimiento.                                               บ"
    db  "บ                                                                              บ"
    db  "บ                           +40 intligencia                                    บ"
    db  "บ                           +20 destreza                                       บ"  
    db  "บ                           +10 carisma                                        บ"                         
    db  "บ                           -20 fuerza                                         บ"    
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                          
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t37 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                            Clerigo                                           บ"
    db  "บ                                                                              บ"
    db  "บ son devotos de una deidad y practicantes de la magia religiosa. Si bien      บ"
    db  "บ todos los clrigos se dedican a dioses especกficos, el poder de estos en     บ"
    db  "บ realidad se deriva de sus creencias personales. A diferencia de la mayorกa   บ"
    db  "บ de los paladines, los clrigos tienden a centrarse en la filosofกa, la       บ"
    db  "บ enseคanza y la relaciขn de las organizaciones religiosas con la gente comฃn. บ" 
    db  "บ La recepciขn que tienen en cualquier parte del mundo depende en gran medida  บ"
    db  "บ de cขmo la gente que vive allก venera o injuria a su dios.                   บ"
    db  "บ                                                                              บ"
    db  "บ                           +40 inteligencia                                   บ"
    db  "บ                           +20 vitalidad                                      บ"  
    db  "บ                           -20 fuerza                                         บ"  
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                            
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t38 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                           Paladin                                            บ"
    db  "บ                                                                              บ"
    db  "บ son fan ticos marciales, devotos de un dios, un gobernante o incluso una     บ" 
    db  "บ forma de vida. Se pueden encontrar en cualquier cultura donde un grupo       บ"
    db  "บ fan tico de individuos de ideas afines haya formado una sociedad guerrera    บ"
    db  "บ dedicada a promover su causa. Entre los que est n alineados con su           บ"
    db  "บ cosmovisiขn, los paladines son vistos con respeto y admiraciขn, aunque con   บ"
    db  "บ un poco de miedo. Muchos paladines ocupan puestos de liderazgo en ejrcitos  บ"
    db  "บ y compaคกas mercenarias, pero en el fragor de la batalla, su fanatismo a     บ"
    db  "บ menudo anula la cadena de mando y el sentido comฃn.                          บ"
    db  "บ                                                                              บ"
    db  "บ                           +20 fuerza                                         บ"
    db  "บ                           +20 vitalidad                                      บ"  
    db  "บ                           +20 inteligencia                                   บ"                         
    db  "บ                           -20 carisma                                        บ"                         
    db  "บ                           -30 destreza                                       บ"  
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                            
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t39 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                            Bardo                                             บ"
    db  "บ                                                                              บ"
    db  "บ En todas las culturas del continente, hay Bardos. Muchos historiadores       บ"
    db  "บ consideran que los bardos son los m s antiguos trabajadores de la magia, sus บ"
    db  "บ cantos manipulan la energกa colectiva de las almas que los rodean,           บ"
    db  "บ oblig ndolas a generar efectos m gicos en una especie de invocacion. En      บ"
    db  "บ algunas sociedades, los Bardos forman grupos organizados de narradores e     บ"
    db  "บ investigadores, pero en la mayor parte del mundo son solo una parte de las   บ"
    db  "บ  tradiciones populares locales.                                              บ"
    db  "บ                                                                              บ"
    db  "บ                           +50 carsima                                        บ"
    db  "บ                           +10 vitalidad                                      บ"  
    db  "บ                           -20 fuerza                                         บ"                         
    db  "บ                           -20 destreza                                       บ"                         
    db  "บ                           -20 inteligencia                                   บ" 
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                             
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

t40 db  "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    db  "บ                            Marginado                                         บ"
    db  "บ                                                                              บ"
    db  "บ            Eres un don nadie. Nunca tuviste que haber existido,              บ"
    db  "บ            pero de alguna manera de las ingeniaste para poder                บ"
    db  "บ                       seguir respirando.                                     บ"
    db  "บ                                                                              บ"
    db  "บ                           -40 fuerza                                         บ"
    db  "บ                           -40 destreza                                       บ"                         
    db  "บ                           -40 inteligencia                                   บ"                         
    db  "บ                           -40 vitalidad                                      บ"  
    db  "บ                           -40 carisma                                        บ" 
    db  "บ                                                                              บ"
    db  "บ                       1) aceptar - 2)volver                                  บ"                        
    db  "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0dh, 0ah, 24h

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

