<?php
$sql = " SELECT tb_usuario.username, tb_endereco.sigla_uf FROM tb_usuario LEFT JOIN tb_endereco ON tb_usuario.cod_usuario=tb_endereco.cod_usuario "
;
include "conexao.php";
$clientes = $fusca->prepare($sql);
$clientes->execute();
$fusca = null;
$n_cli = $clientes->rowCount();
?>
<style>
	.button{
		width: 100px;
	}
</style>
<a href='listar.php'>
	<input class='button' type='button' value='Listar (<?php echo $n_cli; ?>)'>
</a>
<a href='sobre.php'>
	<input class='button' type='button' value='Sobre'>
</a>