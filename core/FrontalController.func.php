<?php

function loadController( $controller ) {
	$controller = ucwords( $controller ).'Controller';
	$strFileController = 'controller/'.$controller'.php';

	if ( !is_file( $strFileController ) ) {
		$strFileController = 'controller/'.ucwords( DEFAULT_CONTROLLER ).'Controller.php'
	}

	require_once $strFileController;
	$controllerObj = new $controller();
	return $controllerObj;
}

function loadAction( $controllerObj, $action ) {
	//$accion = $action;
	$controllerObj->$action();
}

function triggerAction() {
	if ( isset( $_GET['action'] && method_exists( $controllerObj, $_GET['action'] ) ) ) {
		loadAction( $controllerObj, $_GET['action'] );
	} else {
		loadAction( $controllerObj, DEFAULT_ACTION );
	}
}

?>