<!DOCTYPE html>
<?php
    $id = $_GET['codigo'];
    $sql = "SELECT * FROM tb_produtos WHERE id_produto='$id'";
    include "conexao.php";
    $proc_name = $connection_bus -> prepare($sql);
    $proc_name -> execute();
    $connection_bus = null;
    if(isset($_POST['sim'])){
        $desc = $_POST['desc'];
        $valor = $_POST['valor'];
        $cat = $_POST['cat'];
        $obs = $_POST['obs'];
    $sql = "UPDATE tb_produtos SET descricao='$desc', valor='$valor', categoria='$cat', observacao='$obs' WHERE id_produto='$id'";
	include "conexao.php";
	$prod_edt = $connection_bus -> prepare($sql);
	$prod_edt -> execute();
	$connection_bus = null;	
    echo "
		<script>
			alert('Produto editado com sucesso');
			window.location.href='listar.php';
		</script>
	";
    }
?>
<html lang="pt-BR">
    <head>
        <meta charset=utf-8>
        <title>PCJ System</title>
    </head>
    
    <body>
        <hr>
        <h1 align="center"><?php
            foreach($proc_name as $prod){
            $product_name = $prod['descricao'];
			echo 'Editar: '.$product_name;
            }
            ?></h1>
        <hr>

<html lang="pt-br">
	<head><meta charset="UTF-8"><title>PCJ System</title></head>
	<body>
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
				<input type="submit" value="Salvar" name="sim">
                <input type='button' value='Cancelar' onclick='window.history.back();'>
            </form>
        </center>
        
    </body>
</html>