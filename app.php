<?php

authenticate_admin();

require 'Models/Pedidos.php';
require 'Models/Produtos.php';
require 'Models/Clientes.php';

$plugin_link = "?ng=bskapsula/app/";
$element = route(2);
$action = route(3);
$id = route(4);

//require './Autoloader.php'

switch ($element) {
	case 'pedidos':

		if($action == 'delete'){

			$pedidos = AppKapsulaPedidos::find($id);			
			if($pedidos){
				$pedidos->delete();	
			}
			
			r2($plugin_link.'pedidos');
		}

		$pedidos = AppKapsulaPedidos::get();

		view('app_wrapper', [
			'_include' => 'pedidos',
			'url_base' => $plugin_link.'pedidos',
			'pedidos' => $pedidos
		]);

		break;

	case 'produtos':

		$produtos = AppKapsulaProdutos::get();

		view('app_wrapper', [
			'_include' => 'produtos',
			'produtos' => $produtos
		]);
		break;

	case 'clientes':

		$clientes = AppKapsulaClientes::get();

		view('app_wrapper', [
			'_include' => 'clientes',
			'clientes' => $clientes
		]);
		break;
}
