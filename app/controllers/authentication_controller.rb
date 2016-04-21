class AuthenticationController < ApplicationController


  def index
    if !session[:user_id].nil?
      redirect_to :controller => 'user'
    end
    if params[:fail]
      @message = "Efetue o login corretamente"
    else
      @message = ""
    end
  end

  def validate
    if User.check(params[:login], params[:password])
      user = User.find_by_login(params[:login])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to :controller => 'user'
    else
      redirect_to :action => 'index', :fail => true
    end
  end

  def error
    render :text => "Algum erro aconteceu"
  end

  def access_denied
    
  end

  def logout
    if session[:user_id]
      session[:user_id] = nil
      session[:user_name] = nil
    end
    redirect_to :action=>'index'
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :action =>'index', :fail => true
    end
  end

end
