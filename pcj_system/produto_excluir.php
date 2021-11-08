<?php
	$id = $_GET['codigo'];
	//echo "Código capturado = ".$id;
    $name = "SELECT * FROM tb_produtos WHERE id_produto='$id'";
    include "conexao.php";
    $proc_name = $connection_bus -> prepare($name);
    $proc_name -> execute();
    $connection_bus = null;
    if(isset($_POST['sim'])){
	$sql = "DELETE FROM tb_produtos WHERE id_produto='$id'";
	include "conexao.php";
	$prod_exc = $connection_bus -> prepare($sql);
	$prod_exc -> execute();
	$connection_bus = null;		
	echo "
		<script>
			alert('Produto excluído com sucesso');
			window.location.href='listar.php';
		</script>
	";
    }
?>
<html>
	<body>
		<center>
            <?php
            foreach($proc_name as $prod){
            $product_name = $prod['descricao'];
            $product_price = $prod['valor'];
			echo 'Excluir: '.$product_name.' com o valor de: R$ '.$product_price;
            }
            ?>
            <br><br>
			<form action="" method='POST'>
				<input type='submit' value='Sim' name='sim'>
				<input type='button' value='Não' onclick='window.history.back();'>
			</form>
		</center>
	</body>	
</html>