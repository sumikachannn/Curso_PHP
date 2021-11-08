<!DOCTYPE html>
<?php
$capturado = $_GET['cod_usuario'];
$username = $_GET['username'];
if (isset($_POST['sim'])) {
    $tucano = $_POST['valor'];
    $sql = "DELETE FROM tb_usuario WHERE cod_usuario = '$tucano'; DELETE FROM tb_endereco WHERE cod_usuario = '$tucano'; DELETE FROM tb_telefone WHERE cod_usuario = '$tucano'; DELETE FROM tb_documentos_usuario WHERE cod_usuario = '$tucano'";
    include "conexao.php";
    $cli_exc = $fusca->prepare($sql);
    $cli_exc->execute();
    $fusca = null;
    echo "
		<script>
			alert('Contato excluido com sucesso!');
			window.location.href='listar.php';
		</script>
			";
    //header("Location: listar.php");
}
?>
<html>
	<head>
	</head>
	<body>
		<h2>Deseja excluir o cliente <?php echo $username; ?> ?</h2>
		<form action='' method='POST'>
			<input type='hidden' name='valor' value='<?php echo $capturado; ?>'>
			<input type='submit' name='sim' value='SIM'>
			<input type='button' value='NÃO' onclick='window.history.back();'>
		</form>
	</body>
</html>