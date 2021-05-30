{block name="head"}
	
<link rel="stylesheet" type="text/css" href="apps/bskapsula/bootstrap/css/bootstrap.css">
{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	        	<ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" role="tab" data-toggle="tab" href="#pedidos_integrados" aria-selected="true">
				    	Pedidos Integrados
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" role="tab" data-toggle="tab" href="#pedidos_a_integrar" aria-selected="false">
				    	Pedidos a Integrar
					</a>
				  </li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" role="tabpanel" id="pedidos_integrados" aria-labelledby="pedidos_integrados-tab">
						<table class="table" id="ksp_pedidos_integrados">
					  		<thead>
					    		<tr>
				    				<th scope="col">Pedido</th>
				    				<th scope="col">Código Kapsula</th>
				    				<th scope="col">Nome Cliente</th>
				    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
								{foreach $pedidos_integrados as $pedido_integrado}
								    <tr>
								      <td>
								      	<a href="?ng=orders/view/{$pedido_integrado->id_pedido}"> {$pedido_integrado->id_pedido} </a>
								      </td>
								      <td>
								      	<a target="_blank" href="https://ev.kapsula.com.br/pedido/detalhes/		{$pedido_integrado->id_kapsula}"> {$pedido_integrado->id_kapsula}
								      	</a>
								      </td>
								      <td>
								      	{$pedido_integrado->nome_cliente}
								      </td>
								      <td> 
								      	<a class="btn btn-secondary" target="_blank" href="?ng=orders/view/{$pedido_integrado->id_pedido}">Ir para o Pedido</a>
								      	<a class="btn btn-danger" href="{$url_base}/delete/{$pedido_integrado->id}/">
								      		Deletar
								      	</a>
								      </td>
								    </tr>
								{/foreach}
							</tbody>
					    </table>
					</div>
					<div class="tab-pane fade" role="tabpanel" id="pedidos_a_integrar" aria-labelledby="pedidos_a_integrar-tab">
						<table class="table" id="ksp_pedidos_a_integrar">
							<thead>
					    		<tr>
				    				<th scope="col">Cód Pedido</th>
				    				<th scope="col">Nome Cliente</th>
				    				<th scope="col">Data Criação</th>
				    				<th scope="col">Status</th>
				    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
					    		{foreach $pedidos as $pedido}
								<tr>
							    	<td>
							    		<a href="?ng=orders/view/{$pedido->id}"> {$pedido->id} </a>
							    	</td>
							      	<td>
							      		<a class="btn btn-link" target="_blank" href="?ng=contacts/view/6/summary/{$pedido->cid}"> 		{$pedido->account}
							      		</a>
							    	</td>
							    	<td> {$pedido->date}</td>
									<td> {$pedido->status} </td>
							  		<td>
							  			<a class="btn btn-primary ksp_pedido_enviar_kapsula" href="javascript:void(0)" data-pedido="{$pedido->id}">	Enviar para Kapsula
							  			</a>
							  		</td>
							    </tr>
					    		{/foreach}
					    	</tbody>
					    </table>
					</div>
				</div>
			</div>
		</div>
	</div>
	{include file="./modal_template.tpl"}
</div>
<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/notify.min.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}