<?php
    try{
        $connection_bus = new PDO("mysql:host=localhost;dbname=bd_empresa","root","");
        /*echo "Conexão efetuada com sucesso";*/
        }
        catch(PDOException $e){
            echo $e->getMessage();
        }
?>