<!DOCTYPE html>
<?php
	if(isset($_POST['salve'])){
		$nome  = $_POST['nome'];
		$email = $_POST['email'];
		$celular = $_POST['celular'];
		include "conexao.php";
		$sql = "INSERT INTO formulario (nome,email,celular) values ('$nome','$email','$celular')";
		$user = $fusca -> prepare($sql);
		$user -> execute();
		$fusca = null;
	}
?>
<html lang="pt-br">
	<head>
	<META charset="utf-8">
	<title>Agenda</title>
	</head>
	<body>
	<hr>
	<h1 align="center">Formulário</h1>
	</hr>
	<center>
	<?php
		include "menu.php"; 	
	?>
	<form action="" method="post">
		Nome:<br>
		<input type="text" name="nome" placeholder="digite seu nome"><br><br>
		Email:<br>
		<input type="text" name="email" placeholder="digite seu email"><br><br>
		Número:<br>
		<input type="text" name="celular" placeholder="digite seu celular"><br><br>
	<br><br>
	<input type="submit" value="salvar" name="salve">	
	</form>
	</center>
	</body>
	</html>
	