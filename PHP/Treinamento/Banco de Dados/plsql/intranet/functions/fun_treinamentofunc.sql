CREATE OR REPLACE FUNCTION intranet.fun_treinamentofunc RETURN VARCHAR2 IS
    /*----------------------------------------------------------------------------*
    *                                                                             *
    * Esquema..: INTRANET                                                         *
    *                                                                             *
    * Objeto...: fun_congetpacote                                                 *
    *                                                                             *
    * Descri��o: Fun��o que retorna o pacote do usuario app intera��o             *
    *                                                                             *
    * Hist�rico:                                                                  *
    * Data       Autor      Descri��o                                             *
    * ---------- ---------- ----------------------------------------------------- *
    * 01/10/2018 Lisiani    Alera��o em fun��o da inclus�o do campo codinteracao  *
    *                       como chave da tabela                                  * 
    * 25/09/2017 Clayton    Cria��o                                               *
    *-----------------------------------------------------------------------------*/
    v_numero number(10);
BEGIN
   v_numero := 500 * 900;
    RETURN 'Ol� vindo da fun��o do banco de dados oracle. Resultado: ' || v_numero;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Erro xxxxxxx';
END fun_treinamentofunc;
/
