{block name="head"}

{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	            <h2 style="color:#32325d"><strong>Integração Produtos</strong></h2>
	            <a class="btn btn-primary" element="produto" id="ksp_produtos_newbtn" href="javascript:void(0)">Nova</a>
				<table class="table" id="ksp_produtos">
			  		<thead>
			    		<tr>
		    				<th scope="col">Produto</th>
		    				<th scope="col">Código Kapsula</th>
		    				<th scope="col">Ações</th>
			    		</tr>
			    	</thead>
			    	<tbody>
					{foreach $produtos as $produto}
					    <tr>
					      <td>
					      	<a href="?ng=orders/view/{$produto->id_produto}"> {$produto->id_produto} </a>
					      </td>
					      <td>
					      	<a target="_blank" href="https://ev.kapsula.com.br/pacote/atualizar/{$produto->id_kapsula}"> {$produto->id_kapsula}</a>
					      </td>
					      <td> 
					      	<a class="btn btn-danger" href="{$url_base}/delete/{$produto->id}/">Deletar</a>
					      </td>
					    </tr>
					{/foreach}
					</tbody>
			    </table>
			</div>
		</div>
	</div>
</div>
{include file="./modal_template.tpl"}

<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}