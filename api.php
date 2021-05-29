<?php

authenticate_admin();

$action = route(2);
$id = route(3);

require 'Autoloader.php';
require 'standardize.php';

$standart = new BS_TO_KSP();
$retorno['status'] = 0;
$retorno['mensagem'] = 'Nada aqui';

switch($action){
	case 'send_pedido':
		if(!$id){
			echo json_encode($retorno);
			return ;
		}
		
		$integracao = AppKapsulaPedidos::where(['id_pedido' => $id])->first();	
		if($integracao){
			$retorno['status'] = 0;
			$retorno['mensagem'] = "Pedido já integrado";
			echo json_encode($retorno);
			return ;
		}

		$order = Order::find($id);
		$ksp_pedido = $standart->get_kps_pedido($order);
		if(!$ksp_pedido){
			return ;
		}
		$response = $ksp_pedido->post();
		if($response){
			$retorno['status'] = 0;
			if($response->code == 200){
				$retorno['status'] = 1;
				$integracao = new AppKapsulaPedidos();	
				$integracao->id_pedido = $id;
				$integracao->id_kapsula = $response->pedido;
				$integracao->save();
			}
			$retorno['mensagem'] = $response->message;	
			
		}else{
			$retorno['status'] = 0;
			$retorno['mensagem'] = "Não foi possível enviar pedido";
		}

		echo json_encode($retorno);
		break;
}