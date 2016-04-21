class VersionDescriptionController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter :check_permission, :except => [:authenticate, :edit]
  before_filter :load_artefact_status, :only => [:edit]

  def edit
    @permisionFunction = Function.deUsuario(params[:ontology_id], session[:user_id]).include?(Function.find(3)) 
    @users = User.find(:all,:include=>:ontology,:conditions=>["ontology_users.ontology_id = 1"])
    if params[:id]
      unless User.permission(session[:user_id], VersionDescription.find(params[:id]).version.ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
      @version_description = VersionDescription.find(params[:id])
      @version_id = @version_description.version_id
    else
      @version_description = VersionDescription.new
      @version_description.artefact_status_id = ArtefactStatus.find(:first)
      @version_description.purpose = "<h3>Por que o ciclo de vida ser&aacute;
      executado na ontologia?</h3><p>responda aqui</p>"
      @version_id = params[:version_id]

    end
    if request.post?
      @version_description.attributes = params[:version_description]
      @version_description.date = DateTime.now
      if @version_description.save
        redirect_to :controller => 'version', :action => 'show', :id => @version_description.version_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = VersionDescription.find(params[:id])
  end

  def print
    @document = VersionDescription.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = VersionDescription.find(params[:id])
    render :xml=>@document
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    unless User.permission(session[:user_id], VersionDescription.find(params[:id]).version.ontology.id)
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
  end

end
