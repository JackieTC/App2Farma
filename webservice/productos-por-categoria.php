<?php
header('Content-type: application/json');

require('configuracion.php');

$categorias = array();
$category_ID = $_GET['category_id'];
$_where = "1=1";

if(isset($_GET['keyword'])){
	$_where = "nombre LIKE '%".$_GET['keyword']."%'";
}

try{
	$conexion = @mysql_connect(db_servidor, db_usuario, db_clave);
	mysql_select_db(db_nombre, $conexion);
	
	$q = mysql_query("SELECT id_producto AS Menu_ID, nombre AS Menu_name, precio AS Price, CONCAT('img/productos/', imagen) AS Menu_image FROM productos WHERE id_categoria = ".$category_ID." AND ".$_where." ORDER BY id_producto DESC");
	
	while($categoria = mysql_fetch_assoc($q)){
		$categorias[] = array('Menu' => $categoria);
	}
	
	echo json_encode(array('data' => $categorias));
} catch(Exception $e){
	echo json_encode(array('status' => 0, 'data' => 'ERROR: '.$e->getMessage()));
}
?>