CREATE OR REPLACE PROCEDURE intranet.prc_treinamentoproccur(in_coduf     IN addesenv.uf.coduf%TYPE,
                                                            out_mensagem OUT VARCHAR2,
                                                            out_cursor   OUT SYS_REFCURSOR) IS
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
    OPEN out_cursor FOR
        SELECT ci.codcidade,
               ci.coduf,
               ci.codpais,
               ci.nome,
               ci.cep,
               ci.codmec,
               ci.latitude,
               ci.longitude,
               ci.codcidade || ' - ' || ci.nome || ' - ' || ci.coduf AS descricao,
               to_char(SYSDATE, 'dd/mm/yyyy hh24:mi:ss') AS datahorario,
               uf.descricao AS nomeuf,
               pa.nome AS nomepais
        FROM   addesenv.cidade ci
        INNER  JOIN addesenv.uf uf
        ON     uf.coduf = ci.coduf
        AND    uf.codpais = ci.codpais
        INNER  JOIN addesenv.pais pa
        ON     pa.codpais = uf.codpais
        WHERE  ci.coduf = in_coduf;

    out_mensagem := 'Os dados foram consultados com sucesso!';

    RETURN;

EXCEPTION
    WHEN OTHERS THEN
        out_mensagem := 'Ocorreu algum. Erro: ' || SQLCODE || ' - ' || SQLERRM;
END prc_treinamentoproccur;
/
