<?php
	try{
		$fusca = new PDO("mysql:host=localhost;dbname=app_gerenciamento_concessionaria","root","");
	} 
	catch(PDOException $e){
		echo $e->getMessage(); //método amplamente utilizado
	}
?>	
