class CompetenceIssueController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter  :check_permission, :except =>[:authenticate]
  before_filter :load_artefact_status, :only => [:edit]

  def index
    if params[:version_id]
      @questions = CompetenceIssue.find(:all, :conditions =>{:version_id => params[:version_id]})
      @version = Version.find(params[:version_id])
    else
      redirect_to :controller => 'ontology'
    end
  end


  def edit
    if params[:id]
      @competence_issue = CompetenceIssue.find(params[:id])
      @version_id = @competence_issue.version_id
    else
      @competence_issue = CompetenceIssue.new
      #@competence_issue.artefact_status = ArtefactStatus.find(:first)
      @version_id = params[:version_id]
    end
    if request.post?
      @competence_issue.attributes = params[:competence_issue]
      if @competence_issue.save
        redirect_to :action => 'index', :version_id => @competence_issue.version_id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def destroy
    question = CompetenceIssue.find(params[:id])
    if question.destroy
      redirect_to :action => 'index', :version_id => params[:version_id]
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def show
    @questions = CompetenceIssue.find(:all, :conditions =>{:version_id=> params[:version_id]})
    @version = Version.find(params[:version_id])
  end

  def print
    @questions = CompetenceIssue.find(:all, :conditions =>{:version_id=> params[:version_id]})
    @version = Version.find(params[:version_id])
    render :layout=>'artefact'
  end

  def print_xml
    @questions = CompetenceIssue.find(:all, :conditions =>{:version_id=> params[:version_id]})
    render :xml => @questions
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
        unless User.permission(session[:user_id], CompetenceIssue.find(params[:id]).version.ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
      end
    end
  end
end
