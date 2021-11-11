<!DOCTYPE html>
<?PHP

if(isset($_POST['login'])){
$email_digitado = $_POST['email'];
$senha_digitada = md5($_POST['senha']);

$sql = "SELECT * FROM tb_contatos WHERE email='$email_digitado' AND senha='$senha_digitada'";
include "conexao.php";
$login = $fusca -> prepare($sql);
$login -> execute();
$fusca = null;
$linha = $login -> rowCount();
session_start();
if($linha == 1){
    foreach($login as $l){
    $perfil = $l['perfil'];
    }
    $_SESSION['login'] = "yes";
    $_SESSION['perfil'] = $perfil;
    header("Location: listar.php");
}
else{
    session_destroy();
    echo "
			<script>
				alert('Usuário não atorizado');
				window.location.href='login.php';
			</script>
		";
}

}

?>
<html lang="pt-br">
<body>
<hr>
<h1 align="center">Agenda PCJ - Login</h1>
<hr>
<center>
<form action="" method="POST">
Email: <br>
<input type="email" name="email" placeholder="Digite seu e-mail" autofocus><br>
Senha:<br>
<input type="password" name="senha" required><br><br>
<input type="submit" value="login" name="login">
</form>
</center>
</body>
</html>