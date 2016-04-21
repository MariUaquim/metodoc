class KnowledgeAcquisitionController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter :check_permission, :except => [:authenticate]
  before_filter :load_artefact_status, :only => [:edit]

  def edit
    if params[:id]
      @knowledge_acquisition = KnowledgeAcquisition.find(params[:id])
      @version_id = @knowledge_acquisition.version_id
    else
      @knowledge_acquisition = KnowledgeAcquisition.new
      @knowledge_acquisition.artefact_status = ArtefactStatus.find(:first)
      @knowledge_acquisition.sources = "<h3>Especialistas do Domínio</h3>
      <p>responda aqui</p><h3>Livros e Documentos</h3><p>responda aqui</p>
      <h3>Internet (urls)</h3><p>responda aqui</p><h3>Dicionários</h3>
      <p>responda aqui</p><h3>Tesauros</h3><p>responda aqui</p>
      <h3>Ontologias Existentes</h3><p>responda aqui</p>"
      @knowledge_acquisition.strategies = "<h3>Entrevistas</h3><p>responda aqui</p>
      <h3>Reuniões</h3><p>responda aqui</p>"
      @version_id = params[:version_id]
    end
    if request.post?
      @knowledge_acquisition.attributes = params[:knowledge_acquisition]
      if @knowledge_acquisition.save
        redirect_to :controller => 'version', :action => 'show', :id => @knowledge_acquisition.version_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = KnowledgeAcquisition.find(params[:id])
  end

  def print
    @document = KnowledgeAcquisition.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = KnowledgeAcquisition.find(params[:id])
    render :xml => @document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    if params[:id]
      unless User.permission(session[:user_id], KnowledgeAcquisition.find(params[:id]).version.ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
    end
  end
end
