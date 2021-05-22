{block name="head"}

{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	            <h2 style="color:#32325d"><strong>Integração Clientes</strong></h2>
				<table class="table">
			  		<thead>
			    		<tr>
			    				<th scope="col">Cliente</th>
			    				<th scope="col">Código Kapsula</th>
			    				<th scope="col">Ações</th>
			    		</tr>
			    	</thead>
			    	<tbody>
					{foreach $clientes as $cliente}
					    <tr>
					      <td><a href="?ng=orders/view/{$cliente->id_cliente}"> {$cliente->id_cliente}</td>
					      <td>{$cliente->id_kapsula}</td>
					      <td> <a class="btn btn-danger">Deletar</a> </td>
					    </tr>
					{/foreach}
					</tbody>
			    </table>
			</div>
		</div>
	</div>
</div>

{/block}