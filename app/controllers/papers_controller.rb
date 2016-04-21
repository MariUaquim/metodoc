class PapersController < ApplicationController
  # GET /papers
  # GET /papers.xml
  def index
    @papers = Papers.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @papers }
    end
  end

  # GET /papers/1
  # GET /papers/1.xml
  def show
    @papers = Papers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @papers }
    end
  end

  # GET /papers/new
  # GET /papers/new.xml
  def new
    @papers = Papers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @papers }
    end
  end

  # GET /papers/1/edit
  def edit
    @papers = Papers.find(params[:id])
  end

  # POST /papers
  # POST /papers.xml
  def create
    @papers = Papers.new(params[:papers])

    respond_to do |format|
      if @papers.save
        flash[:notice] = 'Papers was successfully created.'
        format.html { redirect_to(@papers) }
        format.xml  { render :xml => @papers, :status => :created, :location => @papers }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @papers.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /papers/1
  # PUT /papers/1.xml
  def update
    @papers = Papers.find(params[:id])

    respond_to do |format|
      if @papers.update_attributes(params[:papers])
        flash[:notice] = 'Papers was successfully updated.'
        format.html { redirect_to(@papers) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @papers.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.xml
  def destroy
    @papers = Papers.find(params[:id])
    @papers.destroy

    respond_to do |format|
      format.html { redirect_to(papers_url) }
      format.xml  { head :ok }
    end
  end
end
