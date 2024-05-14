@ECHO OFF ; no muestra las cosas en pantalla  
tasm intprin
tlink /t intprin
intprin.com
tasm lib
tasm texto
tasm cdp01
tlink cdp01 lib texto
cdp01