#INCLUDE "TOTVS.CH"      
#INCLUDE "TOPCONN.CH"

User Function WCTPAGAR()

Local oProcess       := Nil                                //Objeto da classe TWFProcess.
Local cMailId        := ""                                 //ID do processo gerado.
Local cHostWF        := "http://localhost:8585/"      //URL configurado no ini para WF Link.
Local cTo            := //"andre.brito@ethosx.com.br" E-mail que ir� receber workflfow de aprova��o, configurar via SX6        //Destinat�rio de email.           

//-------------------------------------------------------------------
// "FORMULARIO"
//-------------------------------------------------------------------        

// Instanciamos a classe TWFProcess informando o c�digo e nome do processo.

oProcess := TWFProcess():New("000001", "Treinamento")

oProcess:NewTask("FORMULARIO", "\WF\WF_FORM.html")

// Atribu�mos valor a um dos campos do formul�rio.
oProcess:oHtml:ValByName("TEXT_TIME", Time() )
oProcess:oHtml:ValByName("E2_FILIAL",SE2->E2_FILIAL)
oProcess:oHtml:ValByName("E2_PREFIXO",SE2->E2_PREFIXO)
oProcess:oHtml:ValByName("E2_NUM",SE2->E2_NUM)
oProcess:oHtml:ValByName("E2_PARCELA",SE2->E2_PARCELA)
oProcess:oHtml:ValByName("E2_TIPO",SE2->E2_TIPO)
oProcess:oHtml:ValByName("E2_FORNECE",SE2->E2_FORNECE)
oProcess:oHtml:ValByName("E2_LOJA",SE2->E2_LOJA)

// Informamos o destinat�rio do email contendo o link.

oProcess:cTo := cTo          

// Informamos o assunto do email.

oProcess:cSubject        := "Workflow via link."

// Iniciamos a tarefa e enviamos o email ao destinat�rio.

oProcess:Start()    

//oProcess:bReturn        := "u_wfRetorno()"

Return