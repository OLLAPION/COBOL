000100	       IDENTIFICATION DIVISION.          
000200	       PROGRAM-ID. READFILE.             
000300	       ENVIRONMENT DIVISION.             
000400	       CONFIGURATION SECTION.            
000500	       SOURCE-COMPUTER. IBM-ZOS.         
000600	       OBJECT-COMPUTER. IBM-ZOS.         
000700	       INPUT-OUTPUT SECTION.             
000800	       FILE-CONTROL.                     
000900	           SELECT EMPLOYE ASSIGN TO IN1  
001000	              ORGANIZATION IS INDEXED    
001100	              ACCESS MODE IS RANDOM      
001200	              RECORD KEY IS ID-EMPLOYE   
001300	              FILE STATUS IS TEST-STATUS.
001400	       DATA DIVISION.                    
001500	       FILE SECTION.                     
001600	       FD EMPLOYE.                       
001700	       01 ENR-EMPLOYE.                   
001800	          05 ID-EMPLOYE    PIC X(6).     
001900	          05 FILLER        PIC X.
002000	          05 NAME-EMPLOYE  PIC A(10).         
002100	          05 FILLER        PIC X(2).          
002200	          05 VILLE-EMPLOYE PIC X(6).          
002300	          05 FILLER        PIC X(55).         
002400	       WORKING-STORAGE SECTION.               
002500	       01 WS-EMPLOYE.                         
002600	          05 WS-ID-EMPLOYE    PIC X(6).       
002700	          05 FILLER           PIC X.          
002800	          05 WS-NAME-EMPLOYE  PIC A(10).      
002900	          05 FILLER           PIC X(2).       
003000	          05 WS-VILLE-EMPLOYE PIC X(6).       
003100	          05 FILLER           PIC X(55).      
003200	       01 TEST-STATUS PIC 99.                 
003300	       01 WS-EOF PIC A(1).                    
003400	       PROCEDURE DIVISION.                    
003500	           INITIALIZE TEST-STATUS.            
003600	           OPEN INPUT  EMPLOYE.               
003700	           MOVE '000004' TO ID-EMPLOYE.       
003800	           READ EMPLOYE RECORD INTO WS-EMPLOYE
003900	              KEY IS ID-EMPLOYE               
004000	              INVALID KEY DISPLAY 'INVALID KEY'   
004100	              NOT INVALID KEY DISPLAY WS-EMPLOYE  
004200	              END-READ.                           
004300	           CLOSE EMPLOYE.                         
004400	           STOP RUN.                              
        
