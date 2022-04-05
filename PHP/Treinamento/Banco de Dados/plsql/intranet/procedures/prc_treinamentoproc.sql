CREATE OR REPLACE PROCEDURE intranet.prc_treinamentoproc(in_nome          IN VARCHAR2,
                                                         in_sobrenome     IN VARCHAR2,
                                                         out_nomecompleto OUT VARCHAR2) IS
    /*------------------------------------------------------------------------------------------------*
    *                                                                                                 *
    * Esquema..: intranet                                                                             *
    *                                                                                                 *
    * Objeto...: prc_qtimpconsultaquotasusuario                                                       *
    *                                                                                                 *
    * Descrição: Consulta e retorna em um cursor os dados de quotas de impressão de um usuário        *
    *            específico separadas por tipos, configurações e centros de custos, quando estes      *
    *            estiverem sendo controlados.                                                         *
    *                                                                                                 *
    * Histórico:                                                                                      *
    * Data       Autor      Descrição                                                                 *
    * ---------- ---------- ------------------------------------------------------------------------- *
    * 07/11/2019 Daniel R L Criação.                                                                  *
    *------------------------------------------------------------------------------------------------*/
BEGIN
    out_nomecompleto := 'O nome completo da pessoa é ' || in_nome || ' ' || in_sobrenome;
    RETURN;
END prc_treinamentoproc;
/
