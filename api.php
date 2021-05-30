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
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Id do pedido não recebido';
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
		if(!$order){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Pedido não existente';
			echo json_encode($retorno);
			return ;
		}
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
				$integracao->nome_cliente = $order->cname;
				$integracao->save();
			}else{
				if(isset($response->erros))
					$retorno['erros'] = $response->erros;
			}
			$retorno['mensagem'] = $response->message;	
			
		}else{
			$retorno['status'] = 0;
			$retorno['mensagem'] = "Não foi possível enviar pedido";
		}

		echo json_encode($retorno);
		break;

	case 'send_cliente':
		if(!$id){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Id do cliente não recebido';
			echo json_encode($retorno);
			return ;
		}
		$integracao = AppKapsulaClientes::where(['id_cliente' => $id])->first();	
		if($integracao){
			$retorno['status'] = 0;
			$retorno['mensagem'] = "Cliente já integrado";
			echo json_encode($retorno);
			return ;
		}
		
		$cliente = Contact::find($id);
		if(!$cliente){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Cliente não existente';
			echo json_encode($retorno);
			return ;
		}
		$kps_cliente = $standart->get_ksp_cliente($cliente);
		if(!$kps_cliente){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Não foi possível criar Cliente Kapsula';
			echo json_encode($retorno);
			return ;
		}
		$response = $kps_cliente->post();
		//var_dump($response);
		if($response){
			$retorno['status'] = 0;
			if($response->code == 200){
				$retorno['status'] = 1;
				$integracao = new AppKapsulaClientes();	
				$integracao->id_cliente = $id;
				$integracao->id_kapsula = $response->cliente;
				$integracao->nome_cliente = $cliente->account;
				$integracao->save();
			}else{
				if(isset($response->erros))
					$retorno['erros'] = $response->erros	;
			}
			$retorno['mensagem'] = $response->message;	
			
		}else{
			$retorno['status'] = 0;
			$retorno['mensagem'] = "Não foi possível enviar cliente";
		}

		echo json_encode($retorno);
		break;
}