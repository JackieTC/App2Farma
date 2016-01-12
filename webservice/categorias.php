<?php
header('Content-type: application/json');

require('configuracion.php');

$categorias = array();

try{
	$conexion = @mysql_connect(db_servidor, db_usuario, db_clave);
	mysql_select_db(db_nombre, $conexion);
	
	$q = mysql_query("SELECT id_categoria AS Category_ID, nombre AS Category_name, CONCAT('img/categorias/', imagen) AS Category_image FROM categorias ORDER BY nombre ASC");
	
	while($categoria = mysql_fetch_assoc($q)){
		$categorias[] = array('Category' => $categoria);
	}
	
	echo json_encode(array('data' => $categorias));
} catch(Exception $e){
	echo json_encode(array('status' => 0, 'data' => 'ERROR: '.$e->getMessage()));
}
?>