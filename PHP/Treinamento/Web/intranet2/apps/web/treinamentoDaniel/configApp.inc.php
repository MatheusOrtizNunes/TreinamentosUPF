<?

/**
 * configApp.inc.php - Classes e includes utilizados pelo sistema.
 *
 * Hist�rico:
 * Data       Autor            Descri��o
 * ---------- ---------------- ------------------------------------
 * 23/08/2021 Daniel R. L.     Cria��o.
 *
 * @author danielloro
 * @package web/starterKit2021
 * @copyright Copyright � 2018. Universidade de Passo Fundo. Divis�o de TI.
 * @version 0.1
 */

require_once($_SERVER['DOCUMENT_ROOT'] . "/apps/configDB.inc.php");
require_once('funcDB.inc.php');
require_once('funcApp.inc.php');
require_once($_SERVER['DOCUMENT_ROOT'] . "/lib/JasperReport.class.php");

define("CODAPLICACAO", NULL);
