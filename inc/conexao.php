<?php

$servidor = "127.0.0.1";
$usuario = "etec_user";
$senha = "etec123";
$banco = "etec";

$conexao = new mysqli($servidor, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Erro de conexão: " . $conexao->connect_error);
}

$conexao->set_charset("utf8mb4");

?>