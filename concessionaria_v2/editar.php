<!DOCTYPE html>
<html lang="pt-br">
	<?php
$quadro = $_GET['id'];
$sql = "SELECT tb_usuario.username, tb_usuario.email, tb_usuario.cod_usuario, tb_endereco.sigla_uf, tb_endereco.municipio, tb_endereco.logradouro, tb_endereco.numero_residencial, tb_endereco.numero_apartamento, tb_endereco.cep_endereco, tb_telefone.numero_telefone, tb_documentos_usuario.cpf_docu, tb_documentos_usuario.cnpj_docu, tb_documentos_usuario.rg_docu FROM tb_usuario INNER JOIN tb_endereco INNER JOIN tb_telefone INNER JOIN tb_documentos_usuario WHERE tb_usuario.cod_usuario='$quadro' AND tb_endereco.cod_usuario='$quadro' AND tb_telefone.cod_usuario='$quadro' AND tb_documentos_usuario.cod_usuario='$quadro'";
include 'conexao.php';
$cont = $fusca->prepare($sql);
$cont->execute();
$fusca = null;
foreach ($cont as $bolacha) {}

if (isset($_POST['alterar'])) {
    $email = $_POST['email'];
    $username = $_POST['username'];
    $sigla_uf = $_POST['sigla_uf'];
    $municipio = $_POST['municipio'];
    $logradouro = $_POST['logradouro'];
    $numero_residencial = $_POST['numero_residencial'];
    $numero_apartamento = $_POST['numero_apartamento'];
    $cep_endereco = $_POST['cep_endereco'];
    $numero_telefone = $_POST['numero_telefone'];
    $cpf_docu = $_POST['cpf_docu'];
    $cnpj_docu = $_POST['cnpj_docu'];
    $rg_docu = $_POST['rg_docu'];

    $sql = "
				UPDATE tb_usuario SET
				username             = ?,
				email             = ?,
				WHERE cod_usuario = ?
				UPDATE tb_endereco SET
				sigla_uf             = ?,
				municipio             = ?,
				logradouro			=?,
				numero_residencial  =?,
				numero_apartamento  =?,
				cep_endereco 		=?
				WHERE cod_usuario = ?
				UPDATE tb_telefone SET
				numero_telefone             = ?,
				WHERE cod_usuario = ?
				UPDATE tb_documentos_usuario SET
				cpf_docu             = ?,
				cnpj_docu 			=?,
				rg_docu 			=?
				WHERE cod_usuario = ?
			";
    include 'conexao.php';
    $cli = $fusca->prepare($sql);
    $cli->execute(array($email, $username, $sigla_uf, $municipio, $logradouro, $numero_residencial, $numero_apartamento, $cep_endereco, $numero_telefone, $cpf_docu, $cnpj_docu, $rg_docu, $quadro));
    $fusca = null;
    echo "
			<script>
				alert('Contato alterado com sucesso!');
				window.location.href='listar.php';
			</script>
		";
}

?>
	<head>
		<meta charset="UTF-8">
		<title>Editar entry</title>
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
			Editar Entry - <?php echo $bolacha['username']; ?>
		</h1>
		<hr>
		<?php include 'menu.php';?>
		<hr>
		<div align='center'>
		<form action='' method='post'><!-- início do formulário -->
			Username:<br>
			<input type='text' name='username' value="<?php echo $bolacha['username']; ?>">
			<br><br>
			E-mail:<br>
			<input type='mail' name='email' value="<?php echo $bolacha['email']; ?>">
			<br><br>
			Uf:<br>
			<input type='text' name='sigla_uf' value="<?php echo $bolacha['sigla_uf']; ?>">
			<br><br>
			Municipio:<br>
			<input type='text' name='municipio' value="<?php echo $bolacha['municipio']; ?>">
			<br><br>
			Logradouro:<br>
			<input type='text' name='logradouro' value="<?php echo $bolacha['logradouro']; ?>">
			<br><br>
			Numero Residencial:<br>
			<input type='text' name='numero_residencial' value="<?php echo $bolacha['numero_residencial']; ?>">
			<br><br>
			Numero Apartamento:<br>
			<input type='text' name='numero_apartamento' value="<?php echo $bolacha['numero_apartamento']; ?>">
			<br><br>
			CEP:<br>
			<input type='text' name='cep_endereco' value="<?php echo $bolacha['cep_endereco']; ?>">
			<br><br>
			Numero Telefone:<br>
			<input type='text' name='numero_telefone' value="<?php echo $bolacha['numero_telefone']; ?>">
			<br><br>
			CPF:<br>
			<input type='text' name='cpf_docu' value="<?php echo $bolacha['cpf_docu']; ?>">
			<br><br>
			CNPJ:<br>
			<input type='text' name='cnpj_docu' value="<?php echo $bolacha['cnpj_docu']; ?>">
			<br><br>
			RG:<br>
			<input type='text' name='rg_docu' value="<?php echo $bolacha['rg_docu']; ?>">
			<br><br>
		</form><!-- Fim do formulário -->
		</div>






	</body>
</html>