<!DOCTYPE html>

<?php
	session_start();
	@$login = $_SESSION['login'];
	if($login != "yes"){
		session_destroy();
		echo "
			<script>
				alert('Usuário não atorizado');
				window.location.href='login.php';
			</script>
		";
	}

include "conexao.php";
$sql = "SELECT * FROM tb_contatos ORDER BY nome";
$contatos = $fusca->prepare($sql);
$contatos->execute();
$fusca = null;
$n_cli = $contatos->rowCount();
?>
<html lang="pt-br">
	<head>
		<style>
			a{
				text-decoration: none;
				color: #000000;
			}
			tr:hover {
				background-color: #c0c0c0 ;
			}

		</style>
		<meta charset="UTF-8">
		<title>Lista de Usuários</title>
	</head>
	<body>
		<hr>
		<h1 align='center'>
			Concessionaria Lista de Usuários (<?php echo $n_cli; ?>)
		</h1>
		<hr>
		<!-- menu.php -->
		<?php include 'menu.php';?>
		<?php echo $_SESSION['perfil']; ?>
		<hr>
		<a href="sessao_03_encerra.php">sair</a>
		<div style='font-size: 20px;' align='center'>
			<table border='1'>
				<tr>
					<th>Código</th>
					<th>E-Mail</th>
					<th>Username</th>
					<th>UF</th>
					<th>Municipio</th>
					<th>Logradouro</th>
					<th>Numero Residencial</th>
					<th>Numero Apartamento</th>
					<th>CEP</th>
					<th>Telefone</th>
					<th>CPF</th>
					<th>CNPJ</th>
					<th>RG</th>
					<th>Comandos</th>
				</tr>
				<?php
foreach ($contatos as $bolacha) {
    $codigo = $bolacha['cod_usuario'];
    $email = $bolacha['email'];
    $username = $bolacha['username'];
    $sigla_uf = $bolacha['sigla_uf'];
    $municipio = $bolacha['municipio'];
    $logradouro = $bolacha['logradouro'];
    $numero_residencial = $bolacha['numero_residencial'];
    $numero_apartamento = $bolacha['numero_apartamento'];
    $cep_endereco = $bolacha['cep_endereco'];
    $telefone = $bolacha['numero_telefone'];
    $cpf_docu = $bolacha['cpf_docu'];
    $cnpj_docu = $bolacha['cnpj_docu'];
    $rg_docu = $bolacha['rg_docu'];
    $editar = "
							<a href='editar.php?id=$codigo' title='Editar $username?'>
								Editar
							</a>
						";
    echo "
							<tr>
								<td align='center'>$codigo</td>
								<td>$email</td>
								<td>$username</td>
								<td>$sigla_uf</td>
								<td>$municipio</td>
								<td>$logradouro</td>
								<td>$numero_residencial</td>
								<td>$numero_apartamento</td>
								<td>$cep_endereco</td>
								<td>$telefone</td>
								<td>$cpf_docu</td>
								<td>$cnpj_docu</td>
								<td>$rg_docu</td>
								<td align='center'> &nbsp; $editar &nbsp;</td>
							</tr>
						";
}
?>
			</table>
		</div>
	</body>
</html>