{block name="head"}

{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	           	<ul class="nav nav-tabs">
					<li class="nav-item">
				    	<a class="nav-link active" role="tab" data-toggle="tab" href="#produtos_integrados" aria-selected="true">
				    		Pacotes Integrados
				    	</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" role="tab" data-toggle="tab" href="#produtos_a_integrar" aria-selected="false">
				    		Pacotes a Integrar
						</a>
				  	</li>
				</ul>
				<div class="tab-content">
		   			<div class="tab-pane fade show active" role="tabpanel" id="produtos_integrados" aria-labelledby="produtos_integrados-tab">
						<table class="table" id="lista_produtos_integrados">
					  		<thead>
					    		<tr>
				    				<th scope="col">Produto</th>
				    				<th scope="col">Código Kapsula</th>
				    				<th scope="col">Nome</th>
				    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
							{foreach $produtos_integrados as $produto_integrado}
							    <tr>
							      <td>
							      	<a href="?ng=ps/view/{$produto_integrado->id_produto}"> {$produto_integrado->id_produto} </a>
							      </td>
							      <td>
							      	<a target="_blank" href="https://ev.kapsula.com.br/pacote/atualizar/{$produto_integrado->id_kapsula}"> {$produto_integrado->id_kapsula}</a>
							      </td>
							      <td>
							      	<a target="_blank" href="https://ev.kapsula.com.br/pacote/atualizar/{$produto_integrado->id_kapsula}"> {$produto_integrado->nome_produto}</a>
							      </td>
							      <td> 
							      	<a class="btn btn-danger" href="{$url_base}/delete/{$produto_integrado->id}/">Deletar</a>
							      </td>
							    </tr>
							{/foreach}
							</tbody>
					    </table>
					</div>
					<div class="tab-pane fade" role="tabpanel" id="produtos_a_integrar" aria-labelledby="produtos_a_integrar-tab">
						<table class="table" id="lista_produtos_a_integrar">
					  		<thead>
					    		<tr>
				    				<th scope="col">Código</th>
				    				<th scope="col">Nome</th>
				    				<th scope="col">Valor</th>
				    				<th scope="col">Saldo</th>
				    				<th scope="col">Ações</th>
					    		</tr>
					    	</thead>
					    	<tbody>
							{foreach $produtos as $produto}
							    <tr>
							      <td>
							      	<a href="?ng=ps/products/{$produto->id}"> {$produto->id} </a>
							      </td>
							      <td>
							      	<a target="_blank" href="?ng=ps/products/{$produto->id}">{$produto->name}</a>
							      </td>
							      <td> 
							      		{$produto->sales_price}
							      </td>
							      <td>
							      	<a target="_blank" href="?ng=ps/products/{$produto->id}">{$produto->inventory}</a>
							      </td>
							      <td> 
							      	<!--<a class="btn btn-danger ksp_produto_enviar_kapsula" data-produto="{$produto->id}" href="javascript:void(0)">Enviar para Kapsula</a>-->
							      	<a class="btn btn-danger ksp_produto_integrar_kapsula" data-produto="{$produto->id}" data-nomeproduto="{$produto->description}" href="javascript:void(0)">Vincular com Pacote Kapsula</a>
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
</div>
{include file="./modal_template.tpl"}

<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/notify.min.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}