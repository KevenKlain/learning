# IF

<code>$a = 1;
if($a == 5){
    echo "é igual";
}else{
    echo "não é igual";
}</code><br>
<b>Resultado = não é igual</b>

<h4>Encadeados</h4>
<code>$salario         = 1020;
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
}</code><br>
<b>Resultado: parabéns, você foi promovido</b><br>

<code>$salario = 1020;
$tempo_servico   = 12;
$tem_reclamacoes = false;
if(($salario > 1000) and ($tempo_servico >= 12) and ($tem_reclamacoes !=true)){
    echo 'Parabéns, você foi promovido';
}</code><br>
<b>Resultado = Parabéns, você foi promovido</b><br>

<code>$valor_venda = 1000;
if ($valor_venda > 100){
    $resultado = 'muito caro';
}else{
    $resultado = 'pode comprar';
}
$resultado = ($valor_venda > 100) ? 'muito caro':'pode comprar';</code><br>

# SWITCH

<code>$variavel = 'comando';
switch ($variavel) {
    case "Comando0":
        echo "Resposta";
        break;
    case "Comando1":
        echo "Resposta";
        break;
    default:
        echo "Resposta";
}</code>

# ARRAY

<h4>IMPIRIMINDO UMA POSIÇÃO ESPECIFICA</h4>
<code>$carros = array('Palio', 
                'Corsa', 
                'Gol');
echo $carros[0];</code><br> 
<b>Resultado = Palio</b><br>
<code>echo $carros[1];</code><br>
<b>Resultado = Corsa'</h6><br>
<code>echo $carros[2];</code><br>
<b>Resultado = Gol</h6><br>
<code>echo $carros[1][0];</code><br>
<b>Resultado = C</h6><br>

<h4>TIPO DE ARRAY ASSOCIATIVO</h4>
<code>$carros = array();
$carros ['nome'] = 'Palio';
$carros ['Preço']= 10000;
$carros ['Placa']= 'CDJ8899';</code><br>
<code>print_r($carros);</code><br>
<b>Resultado = Array<br>
            (<br>
                  [nome] => Palio<br>
                  [Preço] => 10000<br>
                  [Placa] => CDJ8899<br>
            )</b><br>

# FOREACH

<code>$celular = array();
$celular ['Modelo'] = 'A71';
$celular ['Marca']  = 'Samsung';
$celular ['Ano']    = 2020;
$celular ['Preço']  = 2.100;</code><br>
<b>Para cada item (na variável $celular, coloque o índice na variável $key e o valor na variável $venda)</b><br>
<code>foreach($celular as $key => $venda){
    echo $key.': '.$venda;
}</code><br>
<b>Resultado:
Modelo: A71<br>
Marca: Samsung<br>
Ano: 2020<br>
Preço: 2.1'</b><br>

<code>$carro = array();
$carro ['Camaro'] = 122000;
$carro ['RS7']    = 150000;
$carro ['BMW']    = 200000;
$carro ['Polo']   =  75000;
$carro ['Golf']   = 110000;
foreach($carro as $key => $venda){
    $formatonu = number_format($venda, 2, ',', '.');
    echo ('O nome do carro é '.$key. ' valor de venda: R$ '.$formatonu);
}</code><br>
<b>Resultado:
O nome do carro é Camaro valor de venda: R$ 122.000,00<br>
O nome do carro é RS7 valor de venda: R$ 150.000,00<br>
O nome do carro é BMW valor de venda: R$ 200.000,00<br>
O nome do carro é Polo valor de venda: R$ 75.000,00<br>
O nome do carro é Golf valor de venda: R$ 110.000,00'</b><br>

<code>$fruta = array("maça", "laranja", "pêra", "banana");
foreach ($fruta as $valor)
{
    print "$valor - ";
}</code><br>
<b>Resultado = maça - laranja - pêra - banana -<b><br>

# FUNCTION

<code>$num_1 = 10;
$num_2 = 10;
function soma($num_1, $num_2){
    $total = $num_1 + $num_2;
    return $total;
}</code><br>
<b>Resultado = 20</b>

<h4>Fazendo requisição de outro arquvio</h4>

<b>Arquivo biblioteca.php</b><br>
<code>function suacor($cor)
{
    switch ($cor) {
    case "Vermelho":
        echo "Sua cor correta é $cor";
        break;
    case "Roxo":
        echo "Sua cor correta é $cor";
        break;
    default:
        echo "Sua cor não é $cor";
    }
}</code>

<b>Arquivo index.php</b><br>
<code>$cor = 'Amarelo';
include 'biblioteca.php';
echo suacor($cor);</code><br>
<b>Resultado = Sua cor correta é Amarelo</b>

<h5>O <b>include</b> serve para chamar o arquivo dentro da pasta.</h5>
<h4>Pode ser usado também o itens:</h4>
<h5><b>require:</b> Identico ao <b>include</b>. Difere somente na manipulação
de erros. Enquanto o include produz uma warning, o require produz uma mensagem de Fatal Error caso o arquivo não exista</h5>
<h5><b>include_once:</b> Funciona da mesma maneira que o comando <b>include</b>, a não ser que o arquivo informado já tenha sido incluído, não refazendo a operação (o arquivo é incluído apenas uma vez). Este comando é util em casos que o programa pode passar mais de uma vez pela mesma intrução. Assim, evitará sobreposições, redeclarações, etc.
</h5>
<h5><b>require_once:</b> Funciona da mesma maneira que o comando <b>require</b>, a não ser que o arquivo informando já tenha sido incluído, não refazendo a operação (o arquivo é incluído apenas uma vez). Este comando é útil em caso em que o programa pode passar mais de uma vez pela mesma instrução. Assim, poderá-se evitar sobreposições, redeclarações etc.</h5><br>

# VARIAVEIS GLOBAIS / ESTATICAS

<h4>GLOBAL</h4>
<code>$total = 0;
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
foreach($teste as $key => $nova){
    echo $key. ': '.$nova;
}</code><br>
<b>Resultado = Milha: 60
               Milha2: 120
               Total: 300</b><br>

<code>print_r($teste);</code><br>
<b>Resultado = Array<br>
(<br>
    [Milha] => 60<br>
    [Milha2] => 120<br>
    [Total] => 300<br>
)</b><br>

<code>echo 'percorreu '. km2mi(100) . " milhas \n";
echo 'percorreu '. km2mi(200) . " milhas \n";
echo 'percorreu no total '. $total . " quilometros \n";</code><br>
<b>Resultado = percorreu 60 milhas percorreu 120 milhas percorreu no total 600 quilometros</b>

<h4>ESTATICA</h4>
<code>function percorre($quilometros)
{
    static $total=1000;
    $total += $quilometros;
    echo "percorreu mais $quilometros do total de $total\n";
}
percorre(100);
percorre(200);
percorre(50);</code><br>
<b>Resultado = percorreu mais 100 do total de 1100 percorreu mais 200 do total de 1300 percorreu mais 50 do total de 1350</b>
