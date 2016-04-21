class UserController < ApplicationController
  before_filter :authenticate, :except => [:authenticate, :show]
  before_filter :load_formality_degrees, :only => [:perfil]

  def index
    @user = User.find(session[:user_id])
    redirect_to :action => 'perfil'
  end

  def perfil
    @user = User.find(session[:user_id])
    @metodologias = Methodology.all
    @ontologias = Ontology.find_own_ontologies(session[:user_id])
	
  end

  def atividades
    @user = User.find(session[:user_id])
    @atividades = ActivityShedule.find(:all, :conditions=>["user_id=?",session[:user_id]])
	
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.new
    end
    if request.post?
      @user.attributes = params[:user]
      @user.password = User.md5(params[:user][:password])
      if @user.save
        redirect_to :controller => 'authentication'
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def settings
    @artefact_models = ArtefactModel.all.collect { |a| [a.name, a.id] }
    @user_option = UserOption.find_by_user_id(session[:user_id])
    if @user_option.nil?
      UserOption.create(:user_id=>session[:user_id], :artefact_model_id=> ArtefactModel.find(:first).id)
      @user_option = UserOption.find_by_user_id(session[:user_id])
    end
  end

  def choose_artefact_model
    user_option = UserOption.find_by_user_id(session[:user_id])
    user_option.artefact_model_id = params[:id]
    if user_option.save
      redirect_to :action=>'settings'
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end
 def monto
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def load_formality_degrees
    @formality_degrees = FormalityDegree.all.collect { |u| [u.name, u.id] }
  end

end
