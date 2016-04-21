class VersionFeasibilityController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter  :check_permission, :except => [:authenticate, :edit]
  before_filter :load_artefact_status, :only => [:edit]

  def edit
    if params[:id]
      #checando permissao
      unless User.permission(session[:user_id], VersionFeasibility.find(params[:id]).version.ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
      @version_feasibility = VersionFeasibility.find(params[:id])
      @version_id = @version_feasibility.version_id
    else
      @version_feasibility = VersionFeasibility.new
      @version_feasibility.artefact_status_id = ArtefactStatus.find(:first)
      @version_feasibility.opportunities = "<h3>Quais são as oportunidades que
      demandam o desenvolvimento do ciclo de vida da ontologia?</h3><p>responda aqui</p>"
      @version_feasibility.problems = "<h3>Quais são os problemas que afetam o
      projeto e desenvolvimento do ciclo de vida da ontologia?</h3><p>responda aqui</p>"
      @version_feasibility.solutions = "<h3>Quais são as potenciais soluções para
      os problemas enfrentados? Como esses problemas podem ser minimizados?</h3>
      <p>responda aqui</p>"
      @version_feasibility.features = "<h3>Ferramentas</h3><p>responda aqui</p>
      <h3>Linguagens</h3><p>responda aqui</p><h3>Hardware</h3><p>responda aqui</p>
      <h3>Humanos</h3><p>responda aqui</p>"
      @version_feasibility.conclusion = "<h3>Quais as decisões tomadas após a
      Análise do Plano de Viabilidade? É viável a implementação do ciclo de vida?</h3>
      <p>responda aqui</p>"
      @version_id = params[:version_id]
    end
    if request.post?
      @version_feasibility.attributes = params[:version_feasibility]
      if @version_feasibility.save
        redirect_to :controller => 'version', :action => 'show', :id => @version_feasibility.version_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = VersionFeasibility.find(params[:id])
  end

  def print
    @document = VersionFeasibility.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = VersionFeasibility.find(params[:id])
    render :xml => @document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    unless User.permission(session[:user_id], VersionFeasibility.find(params[:id]).version.ontology.id)
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
  end
end
