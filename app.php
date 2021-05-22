<?php

authenticate_admin();


$action = route(2);

switch ($action) {
	case 'pedidos':
		view('app_wrapper', [
			'_include' => 'pedidos'
		]);

		break;

	case 'produtos':
		view('app_wrapper', [
			'_include' => 'produtos'
		]);
		break;

	case 'clientes':
		view('app_wrapper', [
			'_include' => 'clientes'
		]);
		break;
}
