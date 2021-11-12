<!DOCTYPE html>
<?php
	//Capturando as informações do formulário
	date_default_timezone_set("America/Cuiaba");
	if(ISSET($_POST['salvar'])){
		$cod       = "";
		$nome      = $_POST['nome'];
		$celular   = $_POST['celular'];
		$email     = $_POST['email'];
		$data_cad  = date("Y-m-d");	
		$data_nasc = $_POST['nasc'];	
		$obs       = $_POST['obs'];
		
		//Instruções para o Banco de dados
		$sql = "INSERT INTO tb_contatos 
			(id_contato,nome,fone,email,data_cadastro,nascimento,obs) 
			VALUES 
			(?,?,?,?,?,?,?)";
		include "conexao.php";
		$cliente = $fusca -> prepare($sql);
		$cliente -> execute(array($cod,$nome,$celular,$email,$data_cad,$data_nasc,$obs));
		$fusca = NULL;
		echo"
			<script>
				alert('Contato inserido com sucesso!');
				window.location.href='listar.php';
			</script>
		";
	}
?>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>Prof. Cezar</title>
		<style>
			a{
				text-decoration: none;
				color: #000000;
			}
		</style>
	</head>	
	<body>
		<hr>
		<h1 align='center'>
			PCJ - Formulário - Cadastrar
		</h1>
		<hr>		
		<!-- 
			action é a ação(destino)
			method é a forma de envio (GET ou POST) 
		-->
		<div align='center'>
			<form action='' method='POST'><!-- Início do formulário -->
				Nome:<br>
				<input type='text' name='nome' placeholder='Digite seu nome' autofocus>
				<br><br>
				Celular:<br>
				<input type='text' name='celular'>
				<br><br>
				E-mail:<br>
				<input type='mail' name='email'>
				<br><br>
				Nascimento:<br>
				<input type='date' name='nasc'>
				<br><br>
				Observação:<br>
				<textarea name='obs'></textarea>
				<br><br>
				<input type='submit' name='salvar' value='Salvar'>
				<input type='button' value='Cancelar' onclick='window.history.back();'>
			</form><!-- Fim do formulário -->
		</div>
		
		
		
		
		
		
	</body>
</html>