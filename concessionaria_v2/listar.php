<!DOCTYPE html>
<html lang="pt-br">
	<?php
$sql = "SELECT tb_usuario.username, tb_usuario.email, tb_usuario.cod_usuario, tb_endereco.sigla_uf, tb_endereco.municipio, tb_endereco.logradouro, tb_endereco.numero_residencial, tb_endereco.numero_apartamento, tb_endereco.cep_endereco, tb_telefone.numero_telefone, tb_documentos_usuario.cpf_docu, tb_documentos_usuario.cnpj_docu, tb_documentos_usuario.rg_docu FROM tb_usuario LEFT JOIN tb_endereco ON tb_usuario.cod_usuario=tb_endereco.cod_usuario LEFT JOIN tb_telefone ON tb_usuario.cod_usuario=tb_telefone.cod_usuario LEFT JOIN tb_documentos_usuario ON tb_usuario.cod_usuario=tb_documentos_usuario.cod_usuario ORDER BY cod_usuario ASC";
include "conexao.php";
$contatos = $fusca->prepare($sql);
$contatos->execute();
$fusca = null;
$n_cli = $contatos->rowCount();
?>
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
		<hr>
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