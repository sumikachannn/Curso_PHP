<!DOCTYPE html>
<?php
    $sql = "SELECT * FROM tb_produtos";
    include "conexao.php";
    $produtos = $connection_bus -> prepare($sql);
    $produtos -> execute();
    $connection_bus = null;
    $product_qtd = $produtos->rowCount();
?>
<html lang="pt-BR">
    <head>
        <meta charset=utf-8>
        <title>PCJ System</title>
    </head>
    
    <body>
        <hr>
        <h1 align="center">Produtos (<?php echo $product_qtd; ?>)</h1>
        <hr>
        <?php
        include "menu.php";
        ?>
        <hr>
        <center>
        <table border="2">
            <tr>
                <th>Cód</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Categoria</th>
                <th>Observação</th>
                <th>OP</th>
            
            </tr>
            <tr>
            <?php

            foreach($produtos as $p){
                $cod = $p['id_produto'];
                $descricao = $p['descricao'];
                $valor = $p['valor'];
                $categoria = utf8_encode($p['categoria']);
                $observacao = utf8_encode($p['observacao']);
                $editar ="<a href='produto_editar.php?codigo=$cod'><input type='button' value='Editar Produto'></a>";
                $excluir = "<a href='produto_excluir.php?codigo=$cod'><input type='button' value='EXCLUIR'></a>";
                
                echo "<tr align='center'>";
                echo "<td>".$cod."</td>";
                echo "<td>".$descricao."</td>";
                echo "<td>".'R$'.$valor."</td>";
                echo "<td>".$categoria."</td>";
                echo "<td>".$observacao."</td>";
                echo "<td>".$editar." ".$excluir."</td>";
                echo "</tr>";
            }

            ?>
            </tr>
        </table>
        </center>
        
    </body>
</html>