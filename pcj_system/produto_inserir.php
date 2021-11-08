<!DOCTYPE html>
<?php
if(isset($_POST['salvar'])){
	$desc = $_POST['desc'];
	$valor = $_POST['valor'];
	$cat = $_POST['cat'];
	$obs = $_POST['obs'];


	$sql = "INSERT INTO tb_produtos (descricao, valor, categoria, observacao) VALUES ('$desc','$valor','$cat','$obs')";
	include "conexao.php";
	$prod_add = $connection_bus -> prepare($sql);
	$prod_add -> execute();
	$connection_bus = null;
	echo "
	<script>
		alert('Produto inserido com sucesso');
		window.location.href='listar.php';
		</script>
		";
}
?>
<html lang="pt-br">
	<head><meta charset="UTF-8"><title>PCJ System</title></head>
	<body>
		<hr>
		<h1 align="center">Adicionar novo produto</h1>
		<hr>
		<?php
			include "menu.php";
			?>
		<center>
			<form action="" method="POST">
				Descrição:<br>
				<input type="text" name="desc" maxlength="150" placeholder="Descrição do produto"><br><br>
				Valor:<br>
				<input type="number" name="valor" min="0" max="9999999999.99" maxlength="12" step=".01" placeholder="0.00"><br><br>
				Categoria:<br>
				<input type="text" name="cat" maxlength="50" placeholder="Categoria do produto"><br><br>
				Observações:<br>
				<input type="text" name="obs" maxlength="200" placeholder="Observações sobre o produto"><br><br>
				<input type="submit" value="Salvar" name="salvar">

			</form>
		</center>
	</body>	
</html>