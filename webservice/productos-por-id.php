<?php
header('Content-type: application/json');

require('configuracion.php');

$categorias = array();
$menu_ID = $_GET['menu_id'];
try{
	$conexion = @mysql_connect(db_servidor, db_usuario, db_clave);
	mysql_select_db(db_nombre, $conexion);
	
	$q = mysql_query("SELECT id_producto AS Menu_ID, nombre AS Menu_name, CONCAT('img/productos/', imagen) AS Menu_image, precio AS Price, estado AS Serve_for, descripcion AS Description, stock AS Quantity FROM productos WHERE id_producto = ".$menu_ID);
	
	while($categoria = mysql_fetch_assoc($q)){
		$categorias[] = array('Menu_detail' => $categoria);
	}
	
	echo json_encode(array('data' => $categorias));
} catch(Exception $e){
	echo json_encode(array('status' => 0, 'data' => 'ERROR: '.$e->getMessage()));
}
?>