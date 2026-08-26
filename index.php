<?php 

include('inc/conexao.php');

$sql_alunos = "SELECT DISTINCT
    ds_matricula,
    nm_aluno,
    ds_email
FROM ALUNOS
ORDER BY ds_matricula";

$resultado_alunos = $conexao->query($sql_alunos);

$sql_professores = "SELECT 
    MIN(cd_professor) AS cd_professor,
    nm_professor,
    MIN(ds_rm_professor) AS ds_rm_professor,
    MIN(ds_email_professor) AS ds_email_professor
FROM PROFESSORES
GROUP BY nm_professor
ORDER BY MIN(cd_professor)";

$resultado_professores = $conexao->query($sql_professores);

$sql_materias = "SELECT 
    MIN(cd_materia) AS cd_materia,
    nm_materia,
    MIN(ds_materia) AS ds_materia
FROM MATERIAS
GROUP BY nm_materia
ORDER BY MIN(cd_materia)";

$resultado_materias = $conexao->query($sql_materias);

$sql_mp = "SELECT 
    MATERIAS.cd_materia,
    MATERIAS.nm_materia,
    GROUP_CONCAT(
        DISTINCT PROFESSORES.nm_professor
        ORDER BY PROFESSORES.nm_professor
        SEPARATOR ' e '
    ) AS nm_professor
FROM MATERIAS
INNER JOIN MATERIAS_PROFESSORES
    ON MATERIAS.cd_materia = MATERIAS_PROFESSORES.cd_materia
INNER JOIN PROFESSORES
    ON MATERIAS_PROFESSORES.cd_professor = PROFESSORES.cd_professor
GROUP BY MATERIAS.cd_materia, MATERIAS.nm_materia
ORDER BY MATERIAS.cd_materia";

$resultado_mp = $conexao->query($sql_mp);

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Banco ETEC</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

    body {
        background-color: #000000;
        font-family: Arial, sans-serif;
        padding-bottom: 50px;
    }

    .container {
        margin-top: 40px;
    }

    .titulo {
        text-align: center;
        margin-bottom: 40px;
    }

    .titulo h1 {
        font-weight: bold;
        color: white;
    }

    .tabela-container {
        margin-bottom: 100px;
    }

    .table {
        background-color: white;
        margin-bottom: 0;
    }

    caption {
        caption-side: top;
        background-color: #8a1e30;
        color: white;
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        padding: 10px;
        border-radius: 8px 8px 0 0;
    }

    th {
        text-align: center;
        background-color: #e9ecef !important;
    }

    td {
        vertical-align: middle;
    }

    </style>

</head>

<body>

<div class="container">

    <div class="titulo">
        <h1>Banco de Dados 2-MDS</h1>
    </div>

    <div class="tabela-container">

        <table class="table table-striped table-bordered">

            <caption>ALUNOS</caption>

            <tr>
                <th>RM</th>
                <th>NOME</th>
                <th>E-MAIL</th>
            </tr>

            <?php

            if ($resultado_alunos->num_rows > 0) {

                while ($aluno = $resultado_alunos->fetch_assoc()) {

                    echo "<tr>";
                    echo "<td>" . $aluno['ds_matricula'] . "</td>";
                    echo "<td>" . $aluno['nm_aluno'] . "</td>";
                    echo "<td>" . $aluno['ds_email'] . "</td>";
                    echo "</tr>";

                }

            }

            ?>

        </table>

    </div>

    <div class="tabela-container">

        <table class="table table-striped table-bordered">

            <caption>PROFESSORES</caption>

            <tr>
                <th>CÓDIGO</th>
                <th>NOME</th>
                <th>RM</th>
                <th>E-MAIL</th>
            </tr>

            <?php

            if ($resultado_professores->num_rows > 0) {

                while ($professor = $resultado_professores->fetch_assoc()) {

                    echo "<tr>";
                    echo "<td>" . $professor['cd_professor'] . "</td>";
                    echo "<td>" . $professor['nm_professor'] . "</td>";
                    echo "<td>" . $professor['ds_rm_professor'] . "</td>";
                    echo "<td>" . $professor['ds_email_professor'] . "</td>";
                    echo "</tr>";

                }

            }

            ?>

        </table>

    </div>

    <div class="tabela-container">

        <table class="table table-striped table-bordered">

            <caption>MATÉRIAS</caption>

            <tr>
                <th>CÓDIGO</th>
                <th>MATÉRIA</th>
                <th>SIGLA</th>
            </tr>

            <?php

            if ($resultado_materias->num_rows > 0) {

                while ($materia = $resultado_materias->fetch_assoc()) {

                    echo "<tr>";
                    echo "<td>" . $materia['cd_materia'] . "</td>";
                    echo "<td>" . $materia['nm_materia'] . "</td>";
                    echo "<td>" . $materia['ds_materia'] . "</td>";
                    echo "</tr>";

                }

            }

            ?>

        </table>

    </div>

    <div class="tabela-container">

        <table class="table table-striped table-bordered">

            <caption>MATÉRIAS E PROFESSORES</caption>

            <tr>
                <th>CÓDIGO</th>
                <th>MATÉRIA</th>
                <th>PROFESSORES</th>
            </tr>

            <?php

            if ($resultado_mp->num_rows > 0) {

                while ($mp = $resultado_mp->fetch_assoc()) {

                    echo "<tr>";
                    echo "<td>" . $mp['cd_materia'] . "</td>";
                    echo "<td>" . $mp['nm_materia'] . "</td>";
                    echo "<td>" . $mp['nm_professor'] . "</td>";
                    echo "</tr>";

                }

            }

            ?>

        </table>

    </div>

</div>

</body>

</html>