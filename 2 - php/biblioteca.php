<?php
$cor = 'Amarelo';
function suacor($cor)
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
}
?>


function soma($num_1, $num_2){
    $total = $num_1 + $num_2;
    return $total;
}