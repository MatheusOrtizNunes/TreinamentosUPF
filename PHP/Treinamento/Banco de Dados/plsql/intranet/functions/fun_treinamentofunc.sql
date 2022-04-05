CREATE OR REPLACE FUNCTION intranet.fun_treinamentofunc RETURN VARCHAR2 IS
    /*----------------------------------------------------------------------------*
    *                                                                             *
    * Esquema..: INTRANET                                                         *
    *                                                                             *
    * Objeto...: fun_congetpacote                                                 *
    *                                                                             *
    * Descrição: Função que retorna o pacote do usuario app interação             *
    *                                                                             *
    * Histórico:                                                                  *
    * Data       Autor      Descrição                                             *
    * ---------- ---------- ----------------------------------------------------- *
    * 01/10/2018 Lisiani    Aleração em função da inclusão do campo codinteracao  *
    *                       como chave da tabela                                  * 
    * 25/09/2017 Clayton    Criação                                               *
    *-----------------------------------------------------------------------------*/
    v_numero number(10);
BEGIN
   v_numero := 500 * 900;
    RETURN 'Olá vindo da função do banco de dados oracle. Resultado: ' || v_numero;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Erro xxxxxxx';
END fun_treinamentofunc;
/
