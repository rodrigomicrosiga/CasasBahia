#Include "PROTHEUS.Ch"

User Function FA080CHK ()

Local lRet := .F.

If Alltrim(SE2->E2_ORIGEM) == 'FISA001' .And. (Empty(SE2->E2_XAUTORI) .Or. SE2->E2_XAUTORI == 'N')

	If MsgYesNo( "T�tulo oriundo de apura��o de impostos, deseja solicitar autoriza��o para baixa?", "Autoriza��o Baixa")
	
		lRet := U_WCTPAGAR()
		
	EndIf
EndIf

Return lRet
