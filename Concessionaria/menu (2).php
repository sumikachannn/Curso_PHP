<?php
	$sql = "SELECT * FROM tb_contatos ORDER BY nome";
	include "conexao.php";
	$clientes  = $fusca -> prepare($sql);
	$clientes -> execute();		
	$fusca = NULL; 	
	$n_cli = $clientes -> rowCount();
?>
<style>
	.button{
		width: 100px;
	}
</style>
<a href='inserir.php'>
	<input class='button' type='button' value='Novo'>
</a>
<a href='listar.php'>
	<input class='button' type='button' value='Listar (<?php echo $n_cli; ?>)'>
</a>
<a href='sobre.php'>
	<input class='button' type='button' value='Sobre'>
</a>