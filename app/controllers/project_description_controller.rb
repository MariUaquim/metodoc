class ProjectDescriptionController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter  :check_permission, :except => [:authenticate, :index, :edit]
  before_filter :load_artefact_status, :only => [:edit]

  def index

  end

  def edit
    if params[:id]
      #checando permissão
      unless User.permission(session[:user_id], ProjectDescription.find(params[:id]).ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
      @project_description = ProjectDescription.find(params[:id])
      @ontology_id = @project_description.ontology_id
    else
      @project_description = ProjectDescription.new
      @project_description.artefact_status_id = ArtefactStatus.find(:first)
      @project_description.purpose = "<h3>Por que a ontologia ser&aacute; constru&iacute;da?
      Quais seus usos pretendidos e benef&iacute;cios esperados?</h3><p>responda aqui</p>
      <h3>Quais s&atilde;o os potenciais usu&aacute;rios?</h3><p>responda aqui</p>
      <h3>Que aplicações deverão (ou poderão) fazer uso da ontologia?</h3><p>responda aqui</p>"
      @ontology_id = params[:ontology_id]
    end
    if request.post?
      @project_description.attributes = params[:project_description]
      @project_description.date = DateTime.now
      if @project_description.save
        redirect_to :controller => 'ontology', :action => 'show', :id => @project_description.ontology_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = ProjectDescription.find(params[:id])
  end

  def print
    @document = ProjectDescription.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = ProjectDescription.find(params[:id])
    render :xml => @document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :fail => true
    end
  end

  def check_permission
    unless User.permission(session[:user_id], ProjectDescription.find(params[:id]).ontology.id)
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
  end

  #def load_artefact_status
    #@artefact_status = ArtefactStatus.all.collect { |u| [u.description, u.id] }
  #end

end
