{block name="head"}

{/block}

{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
			    <h2 style="color:#32325d"><strong>Integração Clientes</strong></h2>
			    <ul class="nav nav-tabs">
				  	<li class="nav-item">
				    	<a class="nav-link active" role="tab" data-toggle="tab" href="#clientes_integrados" aria-selected="true">
				    		Clientes Integrados
				    	</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" role="tab" data-toggle="tab" href="#clientes_a_integrar" aria-selected="false">
				    		Clientes a Integrar
						</a>
					 </li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" role="tabpanel" id="clientes_integrados" aria-labelledby="clientes_integrados-tab">
						<table class="table">
					  		<thead>
					    		<tr>
					    				<th scope="col">Cliente</th>
					    				<th scope="col">Código Kapsula</th>
					    				<th scope="col">Nome</th>
					    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
							{foreach $clientes_integrados as $cliente_integrado}
							    <tr>
							      <td><a href="?ng=contacts/view/{$cliente_integrado->id_cliente}/summary/"> {$cliente_integrado->id_cliente}</td>
							      <td>{$cliente_integrado->id_kapsula}</td>
							      <td>{$cliente_integrado->nome_cliente}</td>
							      <td> 
							      	<a class="btn btn-danger" href="{$url_base}/delete/{$cliente_integrado->id}/">		Deletar
							      	</a> 
							      </td>
							    </tr>
							{/foreach}
							</tbody>
					    </table>
					</div>
					<div class="tab-pane fade" role="tabpanel" id="clientes_a_integrar" aria-labelledby="clientes_a_integrar-tab">
						<table class="table">
					  		<thead>
					    		<tr>
					    				<th scope="col">Cliente</th>
					    				<th scope="col">Nome Cliente</th>
					    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
							{foreach $clientes as $cliente}
							    <tr>
							      <td><a href="?ng=contacts/view/6/summary/{$cliente->id}"> {$cliente->id}</td>
							      <td>
							      	<a class="btn btn-link" target="_blank" href="?ng=contacts/view/{$cliente->id}/summary/">	{$cliente->account}
							      	</a>
							      </td>
							      <td> <a class="btn btn-danger ksp_cliente_enviar_kapsula" data-cliente="{$cliente->id}" href="javascript:void(0)">Integrar com a Kapsula</a> </td>
							    </tr>
							{/foreach}
							</tbody>
						</table>
					</div>	
				</div>

			</div>
		</div>
	</div>
</div>

{include file="./modal_template.tpl"}


<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/notify.min.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}