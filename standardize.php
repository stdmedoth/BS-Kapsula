<?php

use Kapsula\Pedido;
use Kapsula\Produto;
use Kapsula\Cliente;

class BS_TO_KSP {
	public function get_kps_pedido($pedido){
		$ksp_pedido = new Pedido();

		$kps_cliente = AppKapsulaClientes::where('id_cliente', $pedido->userid)->first();	
		if(!$kps_cliente){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Cliente não integrado com a Kapsula';
			echo json_encode($retorno);
			return NULL;
		}
		$ksp_pedido->cliente_id = $kps_cliente->id_kapsula;
		
		$pacote = AppKapsulaProdutos::where('id_produto', $pedido->pacote)->first();
		if(!$pacote){
			$retorno['status'] = 0;
			$retorno['mensagem'] = 'Pacote não integrado com a Kapsula';
			echo json_encode($retorno);
			return NULL;
		}
		$ksp_pedido->pacote_id = $pacote['id_kapsula'];
		$ksp_pedido->tipo_frete = 0;
		$ksp_pedido->valor_venda = $pedido->subtotal;
		return $ksp_pedido;
	} 

	public function get_ksp_cliente($cliente){
		
		$ksp_cliente = new Cliente();
		$ksp_cliente->cpf = $cliente->business_number;
    	$ksp_cliente->nome = $cliente->account;
    	$ksp_cliente->data_nascimento = $cliente->birthday;
    	$ksp_cliente->email = $cliente->email;
    	$ksp_cliente->telefone = $cliente->phone;
    	$ksp_cliente->sexo = 'Desconhecido';
    	$ksp_cliente->cep = $cliente->zip;
    	$ksp_cliente->endereco = $cliente->address;
    	$ksp_cliente->numero = '0';
    	$ksp_cliente->bairro = $cliente->district;
    	$ksp_cliente->cidade = $cliente->city;
    	$ksp_cliente->estado = $cliente->state;
    	$ksp_cliente->pais = $cliente->country;
    	$ksp_cliente->complemento = $cliente->complement;
    	$ksp_cliente->referencia_externa = $cliente->id;
		
		return $ksp_cliente;
	}

	public function get_ksp_produto($item){

	}
}