<?php
$sql = "SELECT id_produto FROM tb_produtos";
include "conexao.php";
$lista = $connection_bus->prepare($sql);
$lista->execute();
$connection_bus = null;
$produtos_qtd = $lista->rowCount();
?>  
<a href="listar.php"><input type="button" value="Produtos (<?php echo $produtos_qtd; ?>)"></a>
<a href="sobre.php"><input type="button" value="Sobre"></a>
<a href="produto_inserir.php"><input type="button" value="Add Produto"></a>
