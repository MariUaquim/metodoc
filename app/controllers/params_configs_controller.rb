class ParamsConfigsController < ApplicationController
  # GET /params_configs
  # GET /params_configs.xml
  def index
    @params_configs = ParamsConfig.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @params_configs }
    end
  end

  # GET /params_configs/1
  # GET /params_configs/1.xml
  def show
    @params_config = ParamsConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @params_config }
    end
  end

  # GET /params_configs/new
  # GET /params_configs/new.xml
  def new
    @params_config = ParamsConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @params_config }
    end
  end

  # GET /params_configs/1/edit
  def edit
    @params_config = ParamsConfig.find(params[:id])
  end

  # POST /params_configs
  # POST /params_configs.xml
  def create
    @params_config = ParamsConfig.new(params[:params_config])

    respond_to do |format|
      if @params_config.save
        flash[:notice] = 'ParamsConfig was successfully created.'
        format.html { redirect_to(@params_config) }
        format.xml  { render :xml => @params_config, :status => :created, :location => @params_config }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @params_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /params_configs/1
  # PUT /params_configs/1.xml
  def update
    @params_config = ParamsConfig.find(params[:id])

    respond_to do |format|
      if @params_config.update_attributes(params[:params_config])
        flash[:notice] = 'ParamsConfig was successfully updated.'
        format.html { redirect_to(@params_config) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @params_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /params_configs/1
  # DELETE /params_configs/1.xml
  def destroy
    @params_config = ParamsConfig.find(params[:id])
    @params_config.destroy

    respond_to do |format|
      format.html { redirect_to(params_configs_url) }
      format.xml  { head :ok }
    end
  end
end
