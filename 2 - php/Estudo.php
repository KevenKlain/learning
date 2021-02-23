<?php
/*
// ARRAY 
//TIPO DE ARRAY JÁ PASSANDO NO PARÂMETRO
$carros = array('Palio', 
                'Corsa', 
                'Gol');
echo $carros[0];
'Resultado = Palio'
   
echo $carros[1];
'//Resultado = Corsa'

echo $carros[2];
'//Resultado = Gol '
 
echo $carros[1][0];
'Resultado = C '

// TIPO DE ARRAY ASSOCIATIVO
$carros = array();
$carros ['nome'] = 'Palio';
$carros ['Preço']= 10000;
$carros ['Placa']= 'CDJ8899';
echo '<pre>';
print_r($carros);
echo '<pre>';
'Resultado = Array
            (
                  [nome] => Palio
                  [Preço] => 10000
                  [Placa] => CDJ8899
            )'

$celular = array();
$celular ['Modelo'] = 'A71';
$celular ['Marca']  = 'Samsung';
$celular ['Ano']    = 2020;
$celular ['Preço']  = 2.100;
//Para cada item (na variável $celular, coloque o índice na variável $key e o valor na variável $venda)
foreach($celular as $key => $venda){
    echo '<br>';
    echo $key.': '.$venda;
}'
Resultado:
Modelo: A71
Marca: Samsung
Ano: 2020
Preço: 2.1'

$carro = array();
$carro ['Camaro'] = 122000;
$carro ['RS7']    = 150000;
$carro ['BMW']    = 200000;
$carro ['Polo']   =  75000;
$carro ['Golf']   = 110000;
foreach($carro as $key => $venda){
    echo '<br>';
    $formatonu = number_format($venda, 2, ',', '.');
    echo ('O nome do carro é '.$key. ' valor de venda: R$ '.$formatonu);
}'
Resultado:
O nome do carro é Camaro valor de venda: R$ 122.000,00
O nome do carro é RS7 valor de venda: R$ 150.000,00
O nome do carro é BMW valor de venda: R$ 200.000,00
O nome do carro é Polo valor de venda: R$ 75.000,00
O nome do carro é Golf valor de venda: R$ 110.000,00'


Definindo um obejeto 

Class Computador
{
    var $cpu;
    function ligar()
    {
        echo "Ligando computador a {$this->cpu}...";
    }
}
$obj = new Computador;
$obj->cpu = "500Mhz";
$obj->ligar();
*/
/*
Estrutura de Controle IF
$a = 1;

if($a == 5){
    echo "é igual";
}else{
    echo "não é igual";
}
*/
/*
Teste encadeados, basta colocar if dentro do if
$salario         = 1020;
$tempo_servico   = 12;
$tem_reclamacoes = false;

if ($salario > 1000)
{
    if($tempo_servico >= 12)
    {
        if($tem_reclamacoes != true)
        {
            echo 'parabéns, você foi promovido';
        }
    }
}
Resultado: parabéns, você foi promovido
*/
/*
$salario         = 1020;
$tempo_servico   = 12;
$tem_reclamacoes = false;
if(($salario > 1000) and ($tempo_servico >= 12) and ($tem_reclamacoes !=true)){
    echo 'Parabéns, você foi promovido';
}
*/
/*
$valor_venda = 1000;
if ($valor_venda > 100){
    $resultado = 'muito caro';
}else{
    $resultado = 'pode comprar';
}
echo $resultado;

$resultado = ($valor_venda > 100) ? 'muito caro':'pode comprar';
echo $resultado;
*/
/*
Estrutura WHILE 
$a = 1;

while ($a < 10){
    print $a;
    $a ++;
}
*/
/*
Estrutura For
for($i = 1; $i <= 10; $i++){
    echo '<br>';
    print $i;
}
*/
/*
$cor = 'Amarelo';

switch ($cor) {
    case "Vermelho":
        echo "Sua cor correta é $cor";
        break;
    case "Roxo":
        echo "Sua cor correta é $cor";
        break;
    case "Amarelo":
        echo "Sua cor correta é $cor";
        break;
    case "Preto":
        echo "Sua cor correta é $cor";
        break;
    default:
        echo "Sua cor não é $cor";
}
*/
/*FOREACH*/
/*
$fruta = array("maça", "laranja", "pêra", "banana");
foreach ($fruta as $valor)
{
    print "$valor - ";
}
*/

/*
include_once 'biblioteca.php';
echo quadrado($cor);
*/
/*
include_once 'calculadora.php';

echo calculadora(10, 30, '*');
*/
/*
$total = 0;
function km2mi($quilometros)
{
    global $total;
    $total += $quilometros;
    return $quilometros * 0.6;
}

$teste = array();
$teste ['Milha'] = km2mi(100);
$teste ['Milha2'] = km2mi(200);
$teste ['Total'] = $total;
/*
foreach($teste as $key => $nova){
    echo '<br>';
    echo $key. ': '.$nova;
}
/*
echo '<pre>';
print_r($teste);
echo '</pre>';

echo 'percorreu '. km2mi(100) . " milhas \n";
echo '<br>';
echo 'percorreu '. km2mi(200) . " milhas \n";
echo '<br>';
echo 'percorreu no total '. $total . " quilometros \n";
*/
/*
function percorre($quilometros)
{
    static $total=10;
    $total += $quilometros;
    echo "percorreu mais $quilometros do total de $total\n";
}

percorre(100);
echo '<br>';
percorre(200);
echo '<br>';
percorre(50);
*/
/*
function incrementa($variavel, $valor)
{
    $variavel += $valor;
    echo $variavel;
    echo '<br>';
}

$a = 10;
incrementa($a, 20);
echo $a;
?>
*/

/*RECUSÃO
function Fatorial($numero)
{
    if ($numero == 1)
    return $numero;
    else 
    return $numero * Fatorial($numero -1);
}
echo Fatorial(5);
echo '<br>';
echo Fatorial(8);

Resultado: 40320
           120 
*/   

/*
$fp = "protocolo/keven/file.txt";
$conteudo = "Conteudo de teste \r\n";
$fp2 = fopen($fp, 'a');
fwrite($fp2, $conteudo);
fclose($fp2);
*/

/*DEIXA LETRA MAIUSCULA
echo strtoupper ('Convertando para maisculo');
*/
/*DEIXA LETRA MINUSCULO
echo strtolower ('CONVERTENDO PARA MINUSCULO');
*/

$rest = substr ("America", 1);
echo $rest;
echo '<br>';
$rest = substr ("America", 1, 3);
echo $rest;
echo '<br>';
$rest = substr ("America", 1, 2);
echo $rest;
echo '<br>';
$rest = substr ("America", 1);
echo $rest;























