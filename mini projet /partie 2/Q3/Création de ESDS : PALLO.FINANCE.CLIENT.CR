000100	//ESDSCR   JOB (ESDSCR),'ESDSCR',MSGLEVEL=(1,1),REGION=4M,        
000200	//          MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                     
000300	//*==============================================================*
000400	//*    ->  DEFINITION ESDS CR                                     
000500	//*==============================================================*
000600	//STEP1    EXEC PGM=IDCAMS                                        
000700	//SYSPRINT DD SYSOUT=*                                            
000800	//SYSIN    DD *                                                   
000900	    DELETE PALLO.FINANCE.CLIENT.CRPS                              
001000	    SET MAXCC = 0                                                 
001100	    DELETE PALLO.FINANCE.CLIENT.CR CLUSTER PURGE                  
001200	    SET MAXCC = 0                                                 
001300	    DEFINE CLUSTER (NAME(PALLO.FINANCE.CLIENT.CR)  -              
001400	            TRACKS ( 1 1 )            -                           
001500	            VOL (FDDBAS)              -                           
001600	            CISZ ( 4096 )             -                           
001700	            RECORDSIZE (  80  80 )    -                           
001800	            SHAREOPTIONS ( 1 3 )      -                           
001900	            NONINDEXED                -                           
002000	            REUSE ) -        
002100	    DATA (NAME(PALLO.FINANCE.CLIENT.CR.DATA))                      
002200	/*                                                                 
002300	//*==============================================================* 
002400	//*    ->  COPY VIA SORT DES CLIENT CR  DANS UN PS                 
002500	//*==============================================================* 
002600	//STEP2    EXEC PGM=SORT                                           
002700	//SYSOUT   DD SYSOUT=*                                             
002800	//SORTIN   DD DSN=PALLO.FINANCE.CLIENT.ESDS,DISP=SHR               
002900	//SORTOUT  DD DSN=PALLO.FINANCE.CLIENT.CRPS,                       
003000	//            DISP=(NEW,CATLG,DELETE),                             
003100	//            VOL=SER=FDDBAS,                                      
003200	//            SPACE=(TRK,(1,1)),                                   
003300	//            DCB=(LRECL=80,BLKSIZE=800,RECFM=FB)                  
003400	//SYSIN    DD *                                                    
003500	    SORT FIELDS=COPY                                               
003600	    INCLUDE COND=(60,2,CH,EQ,C'CR')                                
003700	/*                                                                 
003800	//*==============================================================* 
003900	//*    ->  REPRO DU FICHIER PS A L'ESDS CR                         
004000	//*==============================================================* 
004100	//STEP3    EXEC PGM=IDCAMS                          
004200	//SYSPRINT DD SYSOUT=*                              
004300	//INFILE   DD DSN=PALLO.FINANCE.CLIENT.CRPS,DISP=SHR
004400	//OUTFILE  DD DSN=PALLO.FINANCE.CLIENT.CR,DISP=OLD  
004500	//SYSOUT   DD SYSOUT=*                              
004600	//SYSIN    DD *                                     
004700	    REPRO INFILE(INFILE) OUTFILE(OUTFILE)           
004800	/*                                                  
