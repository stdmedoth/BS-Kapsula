{block name="head"}

{/block}


{block name="content"}
<div class="row">
    <div class="col-md-12">
	    <div class="card">
	        <div class="card-body">
	            <h2 style="color:#32325d"><strong>Configuração Kapsula</strong></h2>
				<form method="POST" action="{$url_base}">
					<label>Token Kapsula</label>
					<input 
						type="text"  
						class="form-control" 
						name="token_kapsula" 
						value="{if $infos_kapsula != NULL} {$infos_kapsula->token}{/if}">	
				</form>
				
			</div>
		</div>
	</div>
</div>
{include file="./modal_template.tpl"}

<script type="text/javascript" src="apps/bskapsula/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="apps/bskapsula/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="apps/bskapsula/js/bskapsula_js.js"></script>
{/block}