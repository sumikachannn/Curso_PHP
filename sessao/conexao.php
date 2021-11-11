<?php
	try{
		$fusca = new PDO("mysql:host=localhost;dbname=bd_agenda","root","");
	} 
	catch(PDOException $e){
		echo $e->getMessage(); //método amplamente utilizado
	}
?>	
