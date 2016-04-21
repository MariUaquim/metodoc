class ProjectFeasibilityController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
   before_filter :load_artefact_status, :only => [:edit]

  def index

  end

  def edit
    if params[:id]
      @project_feasibility = ProjectFeasibility.find(params[:id])
      @ontology_id = @project_feasibility.ontology_id
    else
      @project_feasibility = ProjectFeasibility.new
      @project_feasibility.artefact_status_id = ArtefactStatus.find(:first)
      @project_feasibility.opportunities = "<h3>Quais são as oportunidades que 
      demandam o desenvolvimento desta ontologia ou das aplicações que farão uso
       dela?</h3><p>responda aqui</p>"
      @project_feasibility.problems = "<h3>Quais são os problemas que afetam o
      projeto e desenvolvimento desta ontologia ou das aplicações que farão uso
      dela?</h3><p>responda aqui</p>"
      @project_feasibility.solutions = "<h3>Quais são as potenciais soluções para 
      os problemas enfrentados? Como esses problemas podem ser minimizados?</h3>
      <p>responda aqui</p>"
      @project_feasibility.features = "<h3>Ferramentas</h3><p>responda aqui</p>
      <h3>Linguagens</h3><p>responda aqui</p><h3>Hardware</h3><p>responda aqui</p>
      <h3>Humanos</h3><p>responda aqui</p>"
      @project_feasibility.conclusion = "<h3>Quais as decisões tomadas após a
      Análise do Plano de Viabilidade? É viável a implementação do projeto?</h3>
      <p>responda aqui</p>"
      @ontology_id = params[:ontology_id]
    end
    if request.post?
      @project_feasibility.attributes = params[:project_feasibility]
      if @project_feasibility.save
        redirect_to :controller => 'ontology', :action => 'show', :id => @project_feasibility.ontology_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = ProjectFeasibility.find(params[:id])
  end

  def print
    @document = ProjectFeasibility.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = ProjectFeasibility.find(params[:id])
    render :xml => @document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end
end
