class VersionScheduleController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter  :check_permission, :except =>[:authenticate]
  before_filter :load_artefact_status, :only => [:edit]

  def index
    if params[:version_id]
      @activities = VersionSchedule.find(:all, :conditions =>{:version_id => params[:version_id]})
      @version = Version.find(params[:version_id])
    else
      redirect_to :controller => 'ontology'
    end
  end


  def edit
    if params[:id]
      @version_schedule = VersionSchedule.find(params[:id])
      @version_id = @version_schedule.version_id
    else
      @version_schedule = VersionSchedule.new
      @version_schedule.artefact_status_id = ArtefactStatus.find(:first)
      @version_id = params[:version_id]
    end
    if request.post?
      @version_schedule.activity_date = DateTime.now
      @version_schedule.attributes = params[:version_schedule]
      if @version_schedule.save
        redirect_to :action => 'index', :version_id => @version_schedule.version_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def destroy
    activity = VersionSchedule.find(params[:id])
    if activity.destroy
      redirect_to :action => 'index', :version_id => params[:version_id]
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def show
    @activities = VersionSchedule.find(:all, :conditions =>{:version_id => params[:version_id]})
    @version = Version.find(params[:version_id])
  end

  def print
    @activities = VersionSchedule.find(:all, :conditions =>{:version_id => params[:version_id]})
    @version = Version.find(params[:version_id])
    render :layout=>'artefact'
  end

  def print_xml
    @activities = VersionSchedule.find(:all, :conditions =>{:version_id => params[:version_id]})
    #@version = Version.find(params[:version_id])
    render :xml => @activities
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    if params[:version_id]
      unless User.permission(session[:user_id], Version.find(params[:version_id]).ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
    else
      if params[:id]
        unless User.permission(session[:user_id], VersionSchedule.find(params[:id]).version.ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
      end
    end
  end

end
