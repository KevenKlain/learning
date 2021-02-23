<?php

function calculadora ($valor1, $valor2, $operador)
{
    switch ($operador)
    {
        case "+":
            echo $valor1 + $valor2;
            break;
        case "*":
            echo $valor1 * $valor2;
            break;
        case "/":
            echo $valor1 / $valor2;
            break;
        case "-":
            echo $valor1 - $valor2;
            break;
        default:
            echo "Operado Incorreto";
    }
}
?>