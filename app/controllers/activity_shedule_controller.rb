class ActivitySheduleController < ApplicationController
  before_filter :load_users, :only => [:edit]
  before_filter :load_ontologias

  def nova     
      if request.post?
              @atividade = ActivityShedule.new
	      @atividade.attributes = params[:activity_shedule]
	      @atividade.attributes = {:document_id=> params[:document_id]}
	      @atividade.save
	      @documento = Document.find(params[:document_id])
	      redirect_to :action => 'edit', :document_id=> @documento.id
      end
 end

 def edit
    @documento = Document.find(params[:document_id])
    @atividades = ActivityShedule.find(:all, :conditions=>['activity_shedules.document_id=?', params[:document_id]])

    if request.post?

      @atividade = ActivityShedule.find(params[:id])
      @atividade.attributes = {:document_id=> @documento.id}
      @atividade.attributes = params[:activity_shedule]
      @atividade.save

      redirect_to :action => 'edit', :document_id=> @documento.id
    end

    #redirect_to :controller=>'activity_shedule', :action => 'edit', :document_id=> @documento.ontology_id
  end

  def destroy
   @documento = Document.find(params[:document_id])
   lixo = params[:lixo].split(',')
   lixo.each do |lx_id|
      @atividade = ActivityShedule.find(lx_id)
      @atividade.destroy
   end
   redirect_to :action => 'edit', :document_id=> @documento.id
  end

  def load_ontologias
    @ontologias = Ontology.all
  end

  def load_users
    if params[:document_id]
	    @documento = Document.find(params[:document_id])  
	    if !@documento.ontology_id.nil?
		ontology_id = @documento.ontology_id
	    else
		ontology_id = @documento.version.ontology_id
	    end
    end
    @users = User.find(:all, :include=>'ontology',:conditions=>['ontology_users.ontology_id = ?', ontology_id]).collect { |u| [u.name, u.id] }
  end

end
