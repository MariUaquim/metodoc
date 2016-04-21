class DocTypeConfigsController < ApplicationController
  # GET /doc_type_configs
  # GET /doc_type_configs.xml
  def index
    @doc_type_configs = DocTypeConfig.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doc_type_configs }
    end
  end

  # GET /doc_type_configs/1
  # GET /doc_type_configs/1.xml
  def show
    @doc_type_config = DocTypeConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doc_type_config }
    end
  end

  # GET /doc_type_configs/new
  # GET /doc_type_configs/new.xml
  def new
    @doc_type_config = DocTypeConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doc_type_config }
    end
  end

  # GET /doc_type_configs/1/edit
  def edit
    @doc_type_config = DocTypeConfig.find(params[:id])
  end

  # POST /doc_type_configs
  # POST /doc_type_configs.xml
  def create
    @doc_type_config = DocTypeConfig.new(params[:doc_type_config])

    respond_to do |format|
      if @doc_type_config.save
        flash[:notice] = 'DocTypeConfig was successfully created.'
        format.html { redirect_to(@doc_type_config) }
        format.xml  { render :xml => @doc_type_config, :status => :created, :location => @doc_type_config }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doc_type_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doc_type_configs/1
  # PUT /doc_type_configs/1.xml
  def update
    @doc_type_config = DocTypeConfig.find(params[:id])

    respond_to do |format|
      if @doc_type_config.update_attributes(params[:doc_type_config])
        flash[:notice] = 'DocTypeConfig was successfully updated.'
        format.html { redirect_to(@doc_type_config) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doc_type_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_type_configs/1
  # DELETE /doc_type_configs/1.xml
  def destroy
    @doc_type_config = DocTypeConfig.find(params[:id])
    @doc_type_config.destroy

    respond_to do |format|
      format.html { redirect_to(doc_type_configs_url) }
      format.xml  { head :ok }
    end
  end
end
