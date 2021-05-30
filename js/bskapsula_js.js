$(document).ready( ($)=>{
	$('#ksp_pedidos_newbtn, #ksp_produtos_newbtn, #ksp_clientes_newbtn').on('click', function(){
		$('#kapsula_integracao_modal').modal('show');
	})

	$('.ksp_pedido_enviar_kapsula').on('click',(e)=>{
		let button = $(e.target);
		let pedido_id = button.data('pedido');
		
		button.notify("Aguarde...", "warn");
		$.ajax({
			url: '?ng=bskapsula/api/send_pedido/'+pedido_id,
			method: 'GET',
			success: (response)=>{
				try{
					retorno = JSON.parse(response);	
					if(retorno.status){
						button.notify(retorno.mensagem, "success");
					}else{
						if(retorno.erros){
							retorno.mensagem = '';
							for(let i in retorno.erros){
								retorno.mensagem = retorno.mensagem + '\n' + retorno.erros[i];		
							}
						}
						button.notify(retorno.mensagem, "error");
					}
					
				}catch(error){
					button.notify(error.mensagem, "error");
				}
			}
		});
	});

	$('.ksp_cliente_enviar_kapsula').on('click',(e)=>{
		let button = $(e.target);
		let cliente_id = button.data('cliente');
		
		button.notify("Aguarde...", "warn");
		$.ajax({
			url: '?ng=bskapsula/api/send_cliente/'+cliente_id,
			method: 'GET',
			success: (response)=>{
				try{
					retorno = JSON.parse(response);	
					if(retorno.status){
						button.notify(retorno.mensagem, "success");
					}else{
						if(retorno.erros){
							retorno.mensagem = '';
							for(let i in retorno.erros){
								retorno.mensagem = retorno.mensagem + '\n' + retorno.erros[i];		
							}
						}
						
						button.notify(retorno.mensagem, "error");
					}
					
				}catch(error){
					button.notify(error.mensagem, "error");
				}
			}
		});
	});

	$('.ksp_produto_enviar_kapsula').on('click',(e)=>{
		let button = $(e.target);
		let cliente_id = button.data('cliente');
		
		button.notify("Aguarde...", "warn");
		$.ajax({
			url: '?ng=bskapsula/api/send_produto/'+cliente_id,
			method: 'GET',
			success: (response)=>{
				try{
					retorno = JSON.parse(response);	
					if(retorno.status){
						button.notify(retorno.mensagem, "success");
					}else{
						if(retorno.erros){
							retorno.mensagem = '';
							for(let i in retorno.erros){
								retorno.mensagem = retorno.mensagem + '\n' + retorno.erros[i];		
							}
						}
						
						button.notify(retorno.mensagem, "error");
					}
					
				}catch(error){
					button.notify(error.mensagem, "error");
				}
			}
		});
	});

	$('.ksp_produto_integrar_kapsula').on('click', (e)=>{
		$('#kapsula_integracao_modal').modal('show');
		$('#element_integra_id_bs').val($(e.target).data('produto'));
		$('#element_integra_tabela').val('produto');
		$('#nome_element_integra_tabela').val($(e.target).data('nomeproduto'));
	});

	$('#element_integra_kapsula_form').on('submit', (e)=>{

		console.log('submit');
		let form_data = {
			id_bs: $('#element_integra_id_bs').val(),
			element: $('#element_integra_tabela').val(),
			nome: $('#nome_element_integra_tabela').val(),
			id_kapsula: $('#element_integra_id_kapsula').val()
		};

		$.ajax({
			url: '?ng=bskapsula/api/create_integracao/',
			method: 'POST',
			data: form_data,
			success: (response)=>{
				try{
					let retorno = JSON.parse(response);
					if(retorno.status){
						$('#element_integra_id_bs').notify(retorno.mensagem, 'success');
					}else{
						$('#element_integra_id_bs').notify(retorno.mensagem, 'danger');
					}
				}catch(error){
					$('#element_integra_id_bs').notify(error.message, 'danger');
				}
				
			},
			fail: ()=>{

			}
		});

		e.preventDefault();
		return false;

	});
	
})
