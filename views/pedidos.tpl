{block name="head"}
	
<link rel="stylesheet" type="text/css" href="apps/bskapsula/bootstrap/css/bootstrap.css">
{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	            <h2 style="color:#32325d"><strong>Integração Pedidos</strong></h2>
	            <a class="btn btn-primary" id="ksp_pedidos_newbtn" href="javascript:void(0)">Nova</a>
				<table class="table" id="ksp_pedidos">
			  		<thead>
			    		<tr>
		    				<th scope="col">Pedido</th>
		    				<th scope="col">Código Kapsula</th>
		    				<th scope="col">Ações</th>
			    		</tr>
			    	</thead>
			    	<tbody>
					{foreach $pedidos as $pedido}
					    <tr>
					      <td>
					      	<a href="?ng=orders/view/{$pedido->id_pedido}"> {$pedido->id_pedido} </a>
					      </td>
					      <td>
					      	<a target="_blank" href="https://ev.kapsula.com.br/pedido/detalhes/{$pedido->id_kapsula}"> {$pedido->id_kapsula}</a>
					      </td>
					      <td> 
					      	<a class="btn btn-secondary" href="?ng=orders/view/{$pedido->id_pedido}">Ir para o Pedido</a>
					      	<a class="btn btn-danger" href="{$url_base}/delete/{$pedido->id}/">Deletar</a>
					      </td>
					    </tr>
					{/foreach}
					</tbody>
			    </table>
			</div>
		</div>
	</div>
	{include file="./modal_template.tpl"}
</div>
<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}