<?php
include 'banco.php';

$queryResult=$connect->query("SELECT * FROM relatorio_especialidades");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}

echo json_encode($result);
?>