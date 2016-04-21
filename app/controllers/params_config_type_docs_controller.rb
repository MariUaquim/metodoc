class ParamsConfigTypeDocsController < ApplicationController
  # GET /params_config_type_docs
  # GET /params_config_type_docs.xml
  def index
    @params_config_type_docs = ParamsConfigTypeDoc.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @params_config_type_docs }
    end
  end

  # GET /params_config_type_docs/1
  # GET /params_config_type_docs/1.xml
  def show
    @params_config_type_doc = ParamsConfigTypeDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @params_config_type_doc }
    end
  end

  # GET /params_config_type_docs/new
  # GET /params_config_type_docs/new.xml
  def new
    @params_config_type_doc = ParamsConfigTypeDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @params_config_type_doc }
    end
  end

  # GET /params_config_type_docs/1/edit
  def edit
    @params_config_type_doc = ParamsConfigTypeDoc.find(params[:id])
  end

  # POST /params_config_type_docs
  # POST /params_config_type_docs.xml
  def create
    @params_config_type_doc = ParamsConfigTypeDoc.new(params[:params_config_type_doc])

    respond_to do |format|
      if @params_config_type_doc.save
        flash[:notice] = 'ParamsConfigTypeDoc was successfully created.'
        format.html { redirect_to(@params_config_type_doc) }
        format.xml  { render :xml => @params_config_type_doc, :status => :created, :location => @params_config_type_doc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @params_config_type_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /params_config_type_docs/1
  # PUT /params_config_type_docs/1.xml
  def update
    @params_config_type_doc = ParamsConfigTypeDoc.find(params[:id])

    respond_to do |format|
      if @params_config_type_doc.update_attributes(params[:params_config_type_doc])
        flash[:notice] = 'ParamsConfigTypeDoc was successfully updated.'
        format.html { redirect_to(@params_config_type_doc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @params_config_type_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /params_config_type_docs/1
  # DELETE /params_config_type_docs/1.xml
  def destroy
    @params_config_type_doc = ParamsConfigTypeDoc.find(params[:id])
    @params_config_type_doc.destroy

    respond_to do |format|
      format.html { redirect_to(params_config_type_docs_url) }
      format.xml  { head :ok }
    end
  end
end
