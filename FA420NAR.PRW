#Include "PROTHEUS.Ch"

/*
Ponto de Entrada que permite alterar o nome e extens�o do arquivo de sa�da, gerado a partir da rotina Arquivos de Cobran�as (FINA150).
*/

User Function FA420NAR()

	Local cTeste    := paramixb
	Local cMes      := StrZero( MONTH(DATE()), 2)
	Local cDia      := StrZero( DAY( DATE() ),2)
	Local cDir      := Alltrim(SuperGetMv("MV_XCAMVAN",.F.,""))
	Local lContinua := SuperGetMv("MV_XNOMAUT",.F.,"")

	If lContinua
		cTeste := cDir + "PAG" + Alltrim(mv_par05) + Alltrim(mv_par06) + Alltrim(Str(YEAR(DATE()))) + cMes + cDia
	Else
		Return
	EndIf

Return cTeste