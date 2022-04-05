<?

require_once('configApp.inc.php');

$app = new UpfTpl($orauser, $orapassw, $oradb, "web/treinamentoDaniel/", "index.tpl.html", CODAPLICACAO, TRUE);

//$app->setTemplate('index.tpl.html');

/*
$app->breadcrumb_helper->setTitle('Acadêmico'); //->append('Consulta de motivos não ocupa sala', 'index.php');
$app->breadcrumb_helper->setSubTitle('Consulta de motivos não ocupa sala', 'index.php');
$app->breadcrumb_helper->append('Acadêmico');
$app->breadcrumb_helper->append('Consulta de motivos não ocupa sala', 'index.php');
$app->breadcrumb_helper->mount($app);
*/

$app->breadcrumb_helper->setTitle('Título 1')->setSubTitle('Subtítulo 2')->append('Contabilidade', 'index.php')->append('Lançamentos Contábeis', 'index.php');

$app->setVariable('MENSAGEMBOASVINDAS', 'Olá Mundo!');

$nomes = array('Bruno', 'Daniel', 'Matheus');

/*
echo '<pre>';
print_r($nomes);
echo '</pre>';
exit();
*/

foreach($nomes as $key => $value) {
    $app->setCurrentBlock('BLC_NOMES');
    $app->setVariable('NUMEROORDEM', $key);
    $app->setVariable('NOME', $value);
    $app->parseCurrentBlock('BLC_NOMES');
}

/*
$app->setSessionNameMessages(DEFAULT_SESSION_NAME_MESSAGES);
$app->setSessionInfo(DEFAULT_SESSION_NAME_MESSAGES, 'Oi aqui vai alguma mensagem de informação', 'Informação', TRUE);
$app->setSessionOk(DEFAULT_SESSION_NAME_MESSAGES, 'Oi aqui vai alguma mensagem de sucesso', 'Sucesso', TRUE);
$app->setSessionWarning(DEFAULT_SESSION_NAME_MESSAGES, 'Oi aqui vai alguma mensagem de advertência', 'Advertência', TRUE);
$app->setSessionError(DEFAULT_SESSION_NAME_MESSAGES, 'Oi ocorreu algum Erro 01', 'Aconteceu Algum Erro', TRUE);
$app->setSessionError(DEFAULT_SESSION_NAME_MESSAGES, 'Oi ocorreu algum outro Erro 02', 'Aconteceu Algum Outro Erro', FALSE);
*/

$var_testes = '';
if(0 == 1) {
    $app->touchBlock('BLC_TEXTO');
    $var_testes = 'Apareceu';
}

$app->setVariable('TESTES', $var_testes);

/*
echo '<pre>';
print_r($_POST);
echo '</pre>';
exit();
*/

/*
$treinamentoFunc = treinamentoFunc($app);
echo '<pre>';
print_r($treinamentoFunc);
echo '</pre>';
//exit();

$treinamentoProc = treinamentoProc($app, 'José', 'dos Santos');
echo '<pre>';
print_r($treinamentoProc);
echo '</pre>';
echo $treinamentoProc['VARS']['NOMECOMPLETO'];
//exit();

$treinamentoProcCur = treinamentoProcCur($app, 'RS');
echo '<pre>';
print_r($treinamentoProcCur);
echo '</pre>';
exit();
*/

$treinamentoProcCur = treinamentoProcCur($app, 'RS');

foreach($treinamentoProcCur['RESULT'] as $key => $value) {
    $app->setCurrentBlock('BLC_CIDADES');
    $app->setVariable('CODCIDADE', $value['CODCIDADE']);
    $app->setVariable('NOMECIDADE', $value['NOME']);
    $app->setVariable('NOMEUF', $value['NOMEUF']);
    $app->setVariable('CODPAIS', $value['CODPAIS']);
    $app->setVariable('NOMEPAIS', $value['NOMEPAIS']);
    $app->setVariable('CODMEC', $value['CODMEC']);
    $app->parseCurrentBlock('BLC_CIDADES');
}

$app->show(TRUE, TRUE);
//$app->show_vazio(TRUE, TRUE);
