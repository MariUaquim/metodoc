class MethodologyController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]

  def index
    @methodologias = Methodology.find(:all)
  end

  def details
    @methodologias = Methodology.all
    @methodology = Methodology.find(params[:id])
  end

  def show
    @methodologias = Methodology.all
    @methodology = Methodology.find(params[:id])
    @parametros = ParamsConfigTypeDoc.find(:all)
    @docEspec = DocConfigEspec.find(:all)
  end


  def search
    @methodology = Methodology.new
  end

  def new
    @methodologias = Methodology.all
    if request.post?
       if params[:name]
         @methodology = Methodology.new
         @methodology.attributes = params[:methodology]
         @methodology.save	      
         redirect_to :action =>'show', :id => @methodology.id
       end	
    end
  end

  def newetapa
	if params[:name]
           @etapa = Methodstep.new
           @etapa.attributes = {:name => params[:name], :methodology_id=>params[:id]}
           @etapa.save	      
           redirect_to :controller=>'methodology', :action =>'show', :id => params[:id]
	end
  end

def config
     if params[:pag]
         page = params[:pag]
         if page.include?("stage1")

	    index = page.index('-')+1
	    etapaId = page[index, page.length]
	    @etapa = Methodstep.find(etapaId.to_i)
       	    @etapa.attributes = params[:methodstep]
       	    @etapa.save
            
         elsif page.include?("stage2")
	    doc_type_id = params[:text_id]
	    index = page.index('-')+1
	    etapaId = page[index, page.length]

	    if doc_type_id == "new"
	      @doc = DocType.new
  	      @doc.attributes = { :name => params[:name], :methodstep_id=>etapaId}
       	      @doc.save	      
	    elsif params[:name] == "destroy"
	      @doc = DocType.find(doc_type_id)
	      @doc.destroy
	    else 
	      @doc = DocType.find(doc_type_id)
  	      @doc.attributes = { :name => params[:name], :methodstep_id=>etapaId}
       	      @doc.save
  	    end

         elsif page.include?("stage3") 
	      index = page.index('-')+1
	      etapaId = page[index, page.length]

	      @etapa = Methodstep.find(etapaId.to_i)

	      @etapa.doc_type.each do |d|
	        DocTypeConfig.delete2(d.id)
	      end

	      if params[:configs_ids]
                 configs_ids = params[:configs_ids].split(',')
	         configs_ids.each do |c|
		    doc_type_id = c.split('-')[0]
		    params_config_Type_Doc_id = c.split('-')[1]

		    @config = DocTypeConfig.new
		    @config.attributes = { :doc_type_id => doc_type_id, :params_config_Type_Doc_id => params_config_Type_Doc_id , :answer =>true}
		    @config.save
	        #ontology.users << User.find(params[:user_id]) unless User.find(params[:user_id]).nil?
	      end

	      end
	      if params[:especs_ids]
              	 especs_ids = params[:especs_ids].split(',')
	         especs_ids.each do |e|
		    doc_type_id = e.split('-')[0]
		    doc_config_espec_id = e.split('-')[1]
		    @config = DocTypeConfig.new
		    @config.attributes = { :doc_type_id => doc_type_id, :doc_config_espec_id => doc_config_espec_id , :answer =>false}
		    @config.save
	         end

	      end

	 end
	 redirect_to :action => "show", :id=>params[:id], :pag=>page
      end
end

  def edit
@methodologias = Methodology.all

    if params[:id]
      unless User.permission(session[:user_id], params[:id])
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
      @methodology = Methodology.find(params[:id])
    else
      @methodology = Methodology.new
    end
    if request.post?
      @methodology.attributes = params[:methodology]
      if @methodology.save
        redirect_to :action => 'show', :id=>@methodology.id
      end
    end
  end

  def destroy
    @methodology = Methodology.find(params[:id])
    @methodology.destroy
    redirect_to :action =>'index'
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :fail => true
    end
  end

end
