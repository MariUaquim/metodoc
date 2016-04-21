class FunctionsPapersController < ApplicationController
  # GET /functions_papers
  # GET /functions_papers.xml
  def index
    @functions_papers = FunctionsPapers.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @functions_papers }
    end
  end

  # GET /functions_papers/1
  # GET /functions_papers/1.xml
  def show
    @functions_papers = FunctionsPapers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @functions_papers }
    end
  end

  # GET /functions_papers/new
  # GET /functions_papers/new.xml
  def new
    @functions_papers = FunctionsPapers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @functions_papers }
    end
  end

  # GET /functions_papers/1/edit
  def edit
    @functions_papers = FunctionsPapers.find(params[:id])
  end

  # POST /functions_papers
  # POST /functions_papers.xml
  def create
    @functions_papers = FunctionsPapers.new(params[:functions_papers])

    respond_to do |format|
      if @functions_papers.save
        flash[:notice] = 'FunctionsPapers was successfully created.'
        format.html { redirect_to(@functions_papers) }
        format.xml  { render :xml => @functions_papers, :status => :created, :location => @functions_papers }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @functions_papers.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /functions_papers/1
  # PUT /functions_papers/1.xml
  def update
    @functions_papers = FunctionsPapers.find(params[:id])

    respond_to do |format|
      if @functions_papers.update_attributes(params[:functions_papers])
        flash[:notice] = 'FunctionsPapers was successfully updated.'
        format.html { redirect_to(@functions_papers) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @functions_papers.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /functions_papers/1
  # DELETE /functions_papers/1.xml
  def destroy
    @functions_papers = FunctionsPapers.find(params[:id])
    @functions_papers.destroy

    respond_to do |format|
      format.html { redirect_to(functions_papers_url) }
      format.xml  { head :ok }
    end
  end
end
