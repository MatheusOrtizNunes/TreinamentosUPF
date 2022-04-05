<?

/**
 * funcDB.inc.php - Chama functions e procedures do Banco de Dados
 *
 * Histуrico:
 * Data       Autor            Descriзгo
 * ---------- ---------------- ------------------------------------
 * 23/08/2021 Daniel R. L.     Criaзгo.
 *
 * @author danielloro
 * @package web/starterKit2021
 * @copyright Copyright © 2018. Universidade de Passo Fundo. Divisгo de TI.
 * @version 0.1
 */

// Exemplo de Chamada de Function.
function treinamentoFunc($app)
{
    $result = db($app, "F", "intranet.fun_treinamentofunc");
    return $result;
}

//Exemplo de procedimento sem cursor no retorno
function treinamentoProc($app, $nome, $sobrenome)
{
    $result = db($app, "P", "intranet.prc_treinamentoproc", $nome, $sobrenome, array(NULL, 4000));
    $result['VARS']['NOMECOMPLETO'] = $result['VARS'][2];
    return $result;
}

//Exemplo de procedimento com cursor
function treinamentoProcCur($app, $codUF)
{
    $result = db($app, "C", "intranet.prc_treinamentoproccur", $codUF, array(NULL, 4000));
    return $result;
}
