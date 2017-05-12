<?php
session_start();
set_time_limit(0);
error_reporting(E_ERROR | E_PARSE);
if ($_SESSION['usuario']){
    echo "<script>window.location.href = 'index.php';</script>";
}

$pagina_login = 1;

include 'config.php';
include 'functions.php';


$login = $_POST['login'];
$pwd = $_POST['senha'];
$senha = sha1($pwd);

if ($_GET['go'] == 'cadastrar'){
    $cadnome = $_POST['cadnome'];
    $cadlogin = $_POST['cadlogin'];
    $cadsenha = sha1($_POST['cadsenha']);
    $queryVerifica = mysqli_query($conn,"SELECT * FROM usuario WHERE usuario = '$cadlogin'");
    $countVerifica = mysqli_num_rows($queryVerifica);
    if ($countVerifica == 1){
        echo "<script>alert('Nome de usuário ja cadastrado, tente outro!'); window.location.href = 'index.php';</script>";
    } else {
        $querycadastrar = mysqli_query($conn, "INSERT INTO usuario (nome, usuario, senha) VALUES ('$cadnome', '$cadlogin', '$cadsenha')");
        $_SESSION['usuario'] = new stdClass();
        $_SESSION['usuario']->nome = $cadnome;
        echo "<script>alert('Usuário cadastrado com sucesso!'); window.location.href = 'index.php';</script>";
    }

}

if ($_GET['go'] == 'login'){
    $querylogar = mysqli_query($conn, "SELECT * FROM usuario WHERE usuario = '$login' AND senha = '$senha'");
    $count = mysqli_num_rows($querylogar);
    $obj = $querylogar->fetch_object();
    if ($obj){
        $_SESSION['usuario'] = new stdClass();
        $_SESSION['usuario']->nome = $obj->nome;
        echo "<script>alert('Logado com sucesso!')</script>";
        echo "<script>window.location.href = 'index.php';</script>";

    } else {
        if ($_POST){

        }

    }
}


?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Livro Caixa</title>
    <meta name="LANGUAGE" content="Portuguese" />
    <meta name="AUDIENCE" content="all" />
    <meta name="RATING" content="GENERAL" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="js/scripts.js"></script>
    <link href='css/googleapis.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/normalize.min.css">


    <link rel="stylesheet" href="css/style_login.css">


</head>

<body>
<div class="form">

    <ul class="tab-group">
        <li class="tab active"><a href="#login">Log In</a></li>
        <li class="tab"><a href="#signup">Cadastre-se</a></li>
    </ul>

    <div class="tab-content">

        <div id="login">
            <h1>Bem Vindo!</h1>

            <form action="?go=login" method="post">

                <div class="field-wrap">
                    <label>
                        Usuário<span class="req">*</span>
                    </label>
                    <input type="text" name="login" required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Senha<span class="req">*</span>
                    </label>
                    <input type="password" name="senha" required autocomplete="off"/>
                </div>

                <button class="button button-block"/>
                Entrar</button>

            </form>

        </div>

        <div id="signup">
            <h1>Cadastrar-se</h1>

            <form action="?go=cadastrar" method="post">

                    <div class="field-wrap">
                        <label>
                            Nome<span class="req">*</span>
                        </label>
                        <input type="text" name="cadnome" required autocomplete="off"/>
                    </div>



                <div class="field-wrap">
                    <label>
                        Usuário<span class="req">*</span>
                    </label>
                    <input type="text" name="cadlogin" required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Senha<span class="req">*</span>
                    </label>
                    <input type="password" name="cadsenha" required autocomplete="off"/>
                </div>

                <button type="submit" class="button button-block"/>
                Cadastrar</button>

            </form>

        </div>

    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='js/jquery.min.js'></script>

<script src="js/index.js"></script>

</body>
</html>
