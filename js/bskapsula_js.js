$(document).ready( ($)=>{
	$('#ksp_pedidos_newbtn, #ksp_produtos_newbtn, #ksp_clientes_newbtn').on('click', function(){
		$('#kapsula_integracao_modal').modal('show');
	})

	$('.ksp_pedido_enviar_kapsula').on('click',(e)=>{
		let button = $(e.target);
		let pedido_id = button.data('pedido');
		console.log(pedido_id);
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
						button.notify(retorno.mensagem, "error");
					}
					
				}catch(error){
					button.notify(error.mensagem, "error");
				}
				
				
				
			}
		})
	})
})
