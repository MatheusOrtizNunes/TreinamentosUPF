CREATE OR REPLACE PROCEDURE intranet.prc_treinamentoproc(in_nome          IN VARCHAR2,
                                                         in_sobrenome     IN VARCHAR2,
                                                         out_nomecompleto OUT VARCHAR2) IS
    /*------------------------------------------------------------------------------------------------*
    *                                                                                                 *
    * Esquema..: intranet                                                                             *
    *                                                                                                 *
    * Objeto...: prc_qtimpconsultaquotasusuario                                                       *
    *                                                                                                 *
    * Descri��o: Consulta e retorna em um cursor os dados de quotas de impress�o de um usu�rio        *
    *            espec�fico separadas por tipos, configura��es e centros de custos, quando estes      *
    *            estiverem sendo controlados.                                                         *
    *                                                                                                 *
    * Hist�rico:                                                                                      *
    * Data       Autor      Descri��o                                                                 *
    * ---------- ---------- ------------------------------------------------------------------------- *
    * 07/11/2019 Daniel R L Cria��o.                                                                  *
    *------------------------------------------------------------------------------------------------*/
BEGIN
    out_nomecompleto := 'O nome completo da pessoa � ' || in_nome || ' ' || in_sobrenome;
    RETURN;
END prc_treinamentoproc;
/
