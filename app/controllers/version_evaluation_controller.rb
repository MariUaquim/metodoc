class VersionEvaluationController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter  :check_permission, :except => [:authenticate]
  before_filter :load_artefact_status, :only => [:edit]

  def edit
    if params[:id]
      @version_evaluation = VersionEvaluation.find(params[:id])
      @version_id = @version_evaluation.version.id
    else
      @version_evaluation = VersionEvaluation.new
      @version_evaluation.artefact_status = ArtefactStatus.find(:first)
      @version_evaluation.quality_criteria = "<h3>Clareza</h3><p>responda aqui</p>
      <h3>Coerência</h3><p>responda aqui</p><h3>Corretude</h3><p>responda aqui</p>
      <h3>Confiabilidade</h3><p>responda aqui</p><h3>Desempenho</h3><p>responda aqui</p>
      <h3>Extensibilidade</h3><p>responda aqui</p><h3>Manutenibilidade</h3><p>responda aqui</p>
      <h3>Portabilidade</h3><p>responda aqui</p><h3>Interoperabilidade</h3><p>responda aqui</p>
      <h3>Reusabilidade</h3><p>responda aqui</p>"
      @version_id = params[:version_id]
    end
    if request.post?
      @version_evaluation.attributes = params[:version_evaluation]
      if @version_evaluation.save
        redirect_to :controller => 'version', :action => 'show', :id => @version_evaluation.version.id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = VersionEvaluation.find(params[:id])
  end

  def print
    @document = VersionEvaluation.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = VersionEvaluation.find(params[:id])
    render :xml => @document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    if params[:id]
      unless User.permission(session[:user_id], VersionEvaluation.find(params[:id]).version.ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
    else
      unless request.post?#tratar tambem a checagem quando há request!!!
        unless User.permission(session[:user_id], Version.find(params[:version_id]).ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
      end
    end
  end
end
