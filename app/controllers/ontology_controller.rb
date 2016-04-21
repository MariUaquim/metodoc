class OntologyController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter :check_permission, :except =>[:authenticate, :index, :search, :details, :edit]
  before_filter :load_formality_degrees, :only => [:edit,:index]
  before_filter :load_methodologies, :only => [:edit,:index]
  before_filter :load_ontologias

  def index
    @ontologies = Ontology.find_own_ontologies(session[:user_id])
  end

  def show
    @ontology = Ontology.find(params[:id])
    #1 é o id da função em questão
    @permisionFunction = Function.deUsuario(params[:id], session[:user_id]).include?(Function.find(1)) 
    @etapas = Methodstep.find(:all, :conditions=>["methodsteps.methodology_id = ? AND methodsteps.inlifecycle=?",@ontology.methodology_id,false])
    #@project_description = ProjectDescription.find_by_ontology_id(params[:id])
    #@project_feasibility  = ProjectFeasibility.find_by_ontology_id(params[:id])
    @versions = Version.find(:all, :conditions =>{:ontology_id => params[:id]}, :order => "number DESC")
  end

  def search
    if params[:string]
      @like = "%"
      @like = @like.concat(params[:string][:key].concat("%"))
      if params[:ontology] == "name"
        @ontologies = Ontology.find(:all, :conditions=>["ontologies.name like ? AND ontologies.visible=?",@like,true])
      end
      if params[:ontology] == "project_name"
        @ontologies = Ontology.find(:all, :conditions=>["ontologies.project_name like ? AND ontologies.visible=?",@like,true])
      end
      if params[:ontology] == "domain"
        @ontologies = Ontology.find(:all, :conditions=>["ontologies.domain like ? AND ontologies.visible=?",@like,true])
      end
    end
  end

  def details
    @ontology = Ontology.find(params[:id])
    @current_version = Version.find(:first, :order=>"id desc", :conditions =>{:ontology_id => @ontology.id})
  end

  def edit
    if params[:id]
      unless User.permission(session[:user_id], params[:id])
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
      @ontology = Ontology.find(params[:id])
    else
      @ontology = Ontology.new
      @ontologyUser = OntologyUser.new
      @ontologyUser.attributes = { :ontology_id => @ontology.id, :user_id => session[:user_id], :paper_id => '1' }
      @ontologyUser.save
    end
    if request.post?
      @ontology.attributes = params[:ontology]
      @ontology.visible = false unless params[:ontology][:visible]
      #@ontology.users << User.find(session[:user_id])
      if @ontology.save
        redirect_to :action => "index"
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def destroy
    ontology = Ontology.find(params[:id])
    if ontology.destroy
      redirect_to :action => 'index'
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def add_user
    @ontology = Ontology.find(params[:id])
    #Vamos considerar que pra adicionar colaborador é necessario participar da ontologia(como adm ou gestor)
    if params[:option]=="search"
      @like = "%"
      @like = @like.concat(params[:string].concat("%"))
      if params[:key] == "user"
	@ontologyUser = OntologyUser.find_by_sql(["select * from ontology_users inner join users on user_id =users.id inner join papers on papers.id = paper_id where users.name like ? and ontology_id = ?", @like, params[:id]])
      else
	@ontologyUser = OntologyUser.find_by_sql(["select * from ontology_users inner join users on user_id =users.id inner join papers on papers.id = paper_id where papers.paper like ? and ontology_id = ?", @like, params[:id]])
      end
    else
      @ontologyUser = OntologyUser.find_own_ontologies(params[:id])
    end
    @users = User.find(:all)
    @papers = Paper.find(:all)
  end

  def editing_user
    ontology = Ontology.find(params[:id])
    if params[:option]=="add"
      papersUser = params[:papers_ids].split(',')

      OntologyUser.delete2(params[:id],params[:user_id])

      papersUser.each do |p|
	@ontologyUser = OntologyUser.new
	@ontologyUser.attributes = { :ontology_id => params[:id], :user_id => params[:user_id], :paper_id => p }
        @ontologyUser.save
       #ontology.users << User.find(params[:user_id]) unless User.find(params[:user_id]).nil?
      end

    else
      if params[:option]=="del"
	 
	OntologyUser.delete1(params[:id],params[:user_id],params[:paper_id])
	
      end
    end
    redirect_to :action =>'add_user', :id=>ontology.id
  end

  def load_formality_degrees
    @formality_degrees = FormalityDegree.all.collect { |u| [u.name, u.id] }
  end
  def load_methodologies
    @metodologias = Methodology.all.collect { |u| [u.name, u.id] }
  end

  def load_ontologias
    @ontologias = Ontology.all
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :fail => true
    end
  end

  def check_permission
    unless User.permission(session[:user_id], params[:id])
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
  end
end
