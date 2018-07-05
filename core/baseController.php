<?php

class BaseController {
	public function __construct() {
		require_once 'BaseEntity.php';
		require_once 'BaseModel.php';
	    
	    foreach ( glob('model/*.php') as $file ) {
	    	require_once $file;
	    }	    
	}

	public function view( $view, $data ) {
		foreach ($data as $id_assoc => $value) {
			${ $id_assoc } = $value;
		}

		require_once 'core/helpers.php';
		$helpers = new Helpers();

		require_once 'view/'.$view.'View.php';
	}

	public function redirect( $controller = DEFAULT_CONTROLLER, $action = DEFAULT_ACTION ) {
		header( 'Location:index.php?controller='.$controller.'&action='.$action );
	}
}

?>