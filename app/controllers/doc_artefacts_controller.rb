class DocArtefactsController < ApplicationController
  # GET /doc_artefacts
  # GET /doc_artefacts.xml
  def index
    @doc_artefacts = DocArtefact.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doc_artefacts }
    end
  end

  # GET /doc_artefacts/1
  # GET /doc_artefacts/1.xml
  def show
    @doc_artefact = DocArtefact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doc_artefact }
    end
  end

  # GET /doc_artefacts/new
  # GET /doc_artefacts/new.xml
  def new
    @doc_artefact = DocArtefact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doc_artefact }
    end
  end

  # GET /doc_artefacts/1/edit
  def edit
    @doc_artefact = DocArtefact.find(params[:id])
  end

  # POST /doc_artefacts
  # POST /doc_artefacts.xml
  def create
    @doc_artefact = DocArtefact.new(params[:doc_artefact])

    respond_to do |format|
      if @doc_artefact.save
        flash[:notice] = 'DocArtefact was successfully created.'
        format.html { redirect_to(@doc_artefact) }
        format.xml  { render :xml => @doc_artefact, :status => :created, :location => @doc_artefact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doc_artefact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doc_artefacts/1
  # PUT /doc_artefacts/1.xml
  def update
    @doc_artefact = DocArtefact.find(params[:id])

    respond_to do |format|
      if @doc_artefact.update_attributes(params[:doc_artefact])
        flash[:notice] = 'DocArtefact was successfully updated.'
        format.html { redirect_to(@doc_artefact) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doc_artefact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_artefacts/1
  # DELETE /doc_artefacts/1.xml
  def destroy
    @doc_artefact = DocArtefact.find(params[:id])
    @doc_artefact.destroy

    respond_to do |format|
      format.html { redirect_to(doc_artefacts_url) }
      format.xml  { head :ok }
    end
  end
end
