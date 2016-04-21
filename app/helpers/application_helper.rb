# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def artefact_model_css
    UserOption.find_by_user_id(session[:user_id]).artefact_model.filename
  end

  #formatando as datas das views
  def my_date(date)
    date.strftime("%d de %B de %Y")
  end

end
