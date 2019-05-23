SQL> SELECT * FROM vwCatalogoLibro;

MATER TITULO     AUTOR      TEMA  EDICION                                       
----- ---------- ---------- ----- --------------------                          
M0    Under the  A8         n/a   1                                             
      Domim Tree                                                                
       (Etz Hado                                                                
      mim Tafus)                                                                
                                                                                
M1    Ricky Gerv A3         Publi 2                                             
      ais: Out o            c Uti                                               
      f England             litie                                               
      - The Stan            s                                                   
      d-Up Speci                                                                
      al                                                                        

MATER TITULO     AUTOR      TEMA  EDICION                                       
----- ---------- ---------- ----- --------------------                          
                                                                                
M2    Beat the D A4         n/a   3                                             
      evil                                                                      
                                                                                
M3    Rebellion  A8         n/a   4                                             
      (L'ordre e                                                                
      t la moral                                                                
      e)                                                                        
                                                                                
M4    Uncertaint A8         n/a   5                                             
      y                                                                         

MATER TITULO     AUTOR      TEMA  EDICION                                       
----- ---------- ---------- ----- --------------------                          
                                                                                
M5    Letter fro A6         n/a   6                                             
      m an Unkno                                                                
      wn Woman                                                                  
                                                                                
M6    Wagner's D A7         Consu 7                                             
      ream                  mer S                                               
                            ervic                                               
                            es                                                  
                                                                                
M7    Thick-Wall A7         n/a   8                                             

MATER TITULO     AUTOR      TEMA  EDICION                                       
----- ---------- ---------- ----- --------------------                          
      ed Room, T                                                                
      he (Kabe a                                                                
      tsuki heya                                                                
      )                                                                         
                                                                                
M8    SS Camp 5: A5         n/a   9                                             
       Women's H                                                                
      ell (SS La                                                                
      ger 5: L'i                                                                
      nferno del                                                                
      le donne)                                                                 

MATER TITULO     AUTOR      TEMA  EDICION                                       
----- ---------- ---------- ----- --------------------                          
                                                                                
M9    Kid from B A5         Consu 10                                            
      rooklyn, T            mer S                                               
      he                    ervic                                               
                            es                                                  
                                                                                

10 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM vwCatalogoAutor;

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
A8         Billi                Corking              Under the  L               
                                                     Domim Tree                 
                                                      (Etz Hado                 
                                                     mim Tafus)                 
                                                                                
A3         Hyacintha            Bradtke              Ricky Gerv L               
                                                     ais: Out o                 
                                                     f England                  
                                                     - The Stan                 
                                                     d-Up Speci                 
                                                     al                         

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
                                                                                
A4         Barbi                Spracklin            Beat the D L               
                                                     evil                       
                                                                                
A8         Billi                Corking              Rebellion  L               
                                                     (L'ordre e                 
                                                     t la moral                 
                                                     e)                         
                                                                                
A8         Billi                Corking              Uncertaint L               
                                                     y                          

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
                                                                                
A6         Connie               Thring               Letter fro L               
                                                     m an Unkno                 
                                                     wn Woman                   
                                                                                
A7         Brande               Dawson               Wagner's D L               
                                                     ream                       
                                                                                
A7         Brande               Dawson               Thick-Wall L               
                                                     ed Room, T                 
                                                     he (Kabe a                 

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
                                                     tsuki heya                 
                                                     )                          
                                                                                
A5         Vernice              Dainter              SS Camp 5: L               
                                                      Women's H                 
                                                     ell (SS La                 
                                                     ger 5: L'i                 
                                                     nferno del                 
                                                     le donne)                  
                                                                                
A5         Vernice              Dainter              Kid from B L               

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
                                                     rooklyn, T                 
                                                     he                         
                                                                                
A0         Catlaina             Gerritsma            Algebra1   T               
A1         Andeee               Tuer                 Recursos d T               
                                                     e Construc                 
                                                     cion                       
                                                                                
A2         Annette              Paxforde             Biologia C T               
                                                     elular                     
                                                                                

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
A3         Hyacintha            Bradtke              Newton     T               
A3         Hyacintha            Bradtke              Caida Libr T               
                                                     e                          
                                                                                
A4         Barbi                Spracklin            Calculo V  T               
A7         Brande               Dawson               Ley de Ohm T               
A4         Barbi                Spracklin            Sumas y re T               
                                                     stas                       
                                                                                
A5         Vernice              Dainter              Medicina F T               
                                                     am                         

AUTORID    NOMBREAUTOR          APPATERNO            TITULO     T               
---------- -------------------- -------------------- ---------- -               
                                                                                
A3         Hyacintha            Bradtke              Perritos 1 T               

20 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM vwCatalogoEstatusMaterial;

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
Under the  EJ0        Disponible                                                
Domim Tree                                                                      
 (Etz Hado                                                                      
mim Tafus)                                                                      
                                                                                
Ricky Gerv EJ3        Disponible                                                
ais: Out o                                                                      
f England                                                                       
- The Stan                                                                      
d-Up Speci                                                                      
al                                                                              

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
                                                                                
Ricky Gerv EJ2        Disponible                                                
ais: Out o                                                                      
f England                                                                       
- The Stan                                                                      
d-Up Speci                                                                      
al                                                                              
                                                                                
Ricky Gerv EJ1        Disponible                                                
ais: Out o                                                                      
f England                                                                       

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
- The Stan                                                                      
d-Up Speci                                                                      
al                                                                              
                                                                                
Ricky Gerv EJ0        Disponible                                                
ais: Out o                                                                      
f England                                                                       
- The Stan                                                                      
d-Up Speci                                                                      
al                                                                              
                                                                                

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
Beat the D EJ2        Disponible                                                
evil                                                                            
                                                                                
Beat the D EJ1        Prestado                                                  
evil                                                                            
                                                                                
Beat the D EJ0        Disponible                                                
evil                                                                            
                                                                                
Rebellion  EJ0        Disponible                                                
(L'ordre e                                                                      

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
t la moral                                                                      
e)                                                                              
                                                                                
Uncertaint EJ0        Disponible                                                
y                                                                               
                                                                                
Letter fro EJ0        Disponible                                                
m an Unkno                                                                      
wn Woman                                                                        
                                                                                
Wagner's D EJ0        Disponible                                                

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
ream                                                                            
                                                                                
Thick-Wall EJ0        Disponible                                                
ed Room, T                                                                      
he (Kabe a                                                                      
tsuki heya                                                                      
)                                                                               
                                                                                
SS Camp 5: EJ0        Disponible                                                
 Women's H                                                                      
ell (SS La                                                                      

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
ger 5: L'i                                                                      
nferno del                                                                      
le donne)                                                                       
                                                                                
Kid from B EJ0        Disponible                                                
rooklyn, T                                                                      
he                                                                              
                                                                                
Algebra1   EJ0        Disponible                                                
Recursos d EJ0        Disponible                                                
e Construc                                                                      

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
cion                                                                            
                                                                                
Biologia C EJ1        Disponible                                                
elular                                                                          
                                                                                
Biologia C EJ0        Disponible                                                
elular                                                                          
                                                                                
Newton     EJ1        Disponible                                                
Newton     EJ0        Prestado                                                  
Caida Libr EJ1        Disponible                                                

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
e                                                                               
                                                                                
Caida Libr EJ0        Prestado                                                  
e                                                                               
                                                                                
Calculo V  EJ1        Disponible                                                
Calculo V  EJ0        Prestado                                                  
Ley de Ohm EJ1        Disponible                                                
Ley de Ohm EJ0        Prestado                                                  
Sumas y re EJ0        Disponible                                                
stas                                                                            

TITULO     NOEJEMPLAR DESCRIPCIONE                                              
---------- ---------- --------------------                                      
                                                                                
Medicina F EJ0        Disponible                                                
am                                                                              
                                                                                
Perritos 1 EJ0        Disponible                                                

30 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM vwCatalogoLector;

LECTOR_ID  NOMBRELECTOR         APPATERNOLECTOR      DESCRIPCIONTIPOLECTO       
---------- -------------------- -------------------- --------------------       
L1         Carey                Rustan               Estudiante                 
L5         Danit                Yitzhakov            Estudiante                 
L9         Tynan                Murrey               Estudiante                 
L8         Erna                 Jozwicki             Estudiante                 
L10        Sacha                Scading              Estudiante                 
L3         Alisun               Eckery               Estudiante                 
L6         Mychal               Wooffinden           Investigador               
L7         Neysa                Bytheway             Profesor                   
L4         Krissie              Houndson             Profesor                   
L2         Casey                Sapsforde            Profesor                   

10 rows selected.

SQL> spool off
