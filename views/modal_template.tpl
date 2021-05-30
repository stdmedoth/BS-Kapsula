<div class="modal" tabindex="-1" role="dialog" id="kapsula_integracao_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Informação Integração Kapsula</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="element_integra_kapsula_form" name="element_integra_kapsula_form" method="post" action="?ng=bskapsula/api/create_integracao/">
        <div class="modal-body">
          <div class="card">
            <div class="card-body">
              <h1>Informações</h1>
              <div class="row">
                ID:
                <input type="text" class="form-control" id="element_integra_id_bs" name="element_integra_id_bs">
              </div>
              <div class="row">
                Código Kapsula
                <input type="text" class="form-control" id="element_integra_id_kapsula" name="element_integra_id_kapsula">
              </div>
              <div>
                <input type="hidden" class="form-control" id="element_integra_tabela" name="element_integra_tabela">
                <input type="hidden" class="form-control" id="nome_element_integra_tabela" name="nome_element_integra_tabela">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" id="element_integra_concluir" class="btn btn-primary">Salvar Alterações</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        </div>  
      </form>
    </div>
  </div>
</div>