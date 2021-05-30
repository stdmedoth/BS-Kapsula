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
		$id_list = array_map(function($e){return $e['id_pedido'];},  $pedidos_integrados->toArray());
		$pedidos = Invoice::whereNotIn( 'id', $id_list )->orderBy('duedate','DESC')->get();

		view('app_wrapper', [
			'_include' => 'pedidos',
			'url_base' => $plugin_link.'pedidos',
			'pedidos' => $pedidos,
			'pedidos_integrados' => $pedidos_integrados
		]);

		break;

	case 'produtos':

		if($action == 'delete'){
			$produtos = AppKapsulaProdutos::find($id);			
			if($produtos){
				$produtos->delete();	
			}
			r2($plugin_link.'produtos');
		}

		$produtos_integrados = AppKapsulaProdutos::get();
		$id_list = array_map(function($e){return $e['id_produto'];},  $produtos_integrados->toArray());
		$produtos = InvoiceItem::whereNotIn( 'id', $id_list )->orderBy('duedate','DESC')->get();

		view('app_wrapper', [
			'url_base' => $plugin_link.'produtos',
			'_include' => 'produtos',
			'produtos_integrados' => $produtos_integrados,
			'produtos' => $produtos
		]);
		break;

	case 'clientes':

		if($action == 'delete'){
			$clientes = AppKapsulaClientes::find($id);			
			if($clientes){
				$clientes->delete();	
			}
			r2($plugin_link.'clientes');
		}
		
		$clientes_integrados = AppKapsulaClientes::get();
		$id_list = array_map(function($e){return $e['id_cliente'];},  $clientes_integrados->toArray());		
		$clientes = Contact::whereNotIn( 'id', $id_list )->get();

		view('app_wrapper', [
			'_include' => 'clientes',
			'url_base' => $plugin_link.'clientes',
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
