<?php

authenticate_admin();

$plugin_link = "?ng=bskapsula/app/";
$element = route(2);
$action = route(3);
$id = route(4);

switch ($element) {
	case 'pedidos':

		if($action == 'delete'){

			$pedidos = AppKapsulaPedidos::find($id);			
			if($pedidos){
				$pedidos->delete();	
			}
			
			r2($plugin_link.'pedidos');
		}

		$pedidos_integrados = AppKapsulaPedidos::get();
		$pedidos = Order::get();

		view('app_wrapper', [
			'_include' => 'pedidos',
			'url_base' => $plugin_link.'pedidos',
			'pedidos' => $pedidos,
			'pedidos_integrados' => $pedidos_integrados
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

		$clientes_integrados = AppKapsulaClientes::get();
		$clientes = Contact::get();

		view('app_wrapper', [
			'_include' => 'clientes',
			'clientes_integrados' => $clientes_integrados,
			'clientes' => $clientes
		]);
		break;

	case 'config' : 

		$token = '';
		if(defined('__KAPSULA_TOKEN__'))
			$token = __KAPSULA_TOKEN__;

		$infos = AppKapsulaInfos::get()->first();
		if( _post('token_kapsula') ){
			if(!$infos){
				$infos = new AppKapsulaInfos();
			}

			$infos->token = _post('token_kapsula');
			$infos->save();	
			
		}

		

		view('app_wrapper', [
			'_include' => 'config',
			'url_base' => $plugin_link.'config',
			'infos_kapsula' => $infos
		]);
		break;
}
