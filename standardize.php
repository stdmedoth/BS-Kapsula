<?php

use Kapsula\Pedido;
use Kapsula\Produto;
use Kapsula\Cliente;

class BS_TO_KSP {
	public function get_kps_pedido($pedido){
		$ksp_pedido = new Pedido();

		$kps_cliente = AppKapsulaPedidos::find($pedido->cid);	
		if(!$kps_cliente){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Cliente não integrado com a Kapsula';
			echo json_encode($retorno);
			return NULL;
		}
		$ksp_pedido->cliente_id = $kps_cliente->id_cliente;
		$ksp_pedido->pacote_id = 11553;
		$ksp_pedido->tipo_frete = 0;
		$ksp_pedido->valor_venda = 0;
		return $ksp_pedido;
	} 

	public function get_ksp_cliente($cliente){

	}

	public function get_ksp_produto($item){

	}
}