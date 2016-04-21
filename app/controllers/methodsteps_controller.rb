class MethodstepsController < ApplicationController
  # GET /methodsteps
  # GET /methodsteps.xml
  def index
    @methodsteps = Methodstep.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @methodsteps }
    end
  end

  # GET /methodsteps/1
  # GET /methodsteps/1.xml
  def show
    @methodstep = Methodstep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @methodstep }
    end
  end

  # GET /methodsteps/new
  # GET /methodsteps/new.xml
  def new
    @methodstep = Methodstep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @methodstep }
    end
  end

  # GET /methodsteps/1/edit
  def edit
    @methodstep = Methodstep.find(params[:id])
  end

  # POST /methodsteps
  # POST /methodsteps.xml
  def create
    @methodstep = Methodstep.new(params[:methodstep])

    respond_to do |format|
      if @methodstep.save
        flash[:notice] = 'Methodstep was successfully created.'
        format.html { redirect_to(@methodstep) }
        format.xml  { render :xml => @methodstep, :status => :created, :location => @methodstep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @methodstep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /methodsteps/1
  # PUT /methodsteps/1.xml
  def update
    @methodstep = Methodstep.find(params[:id])

    respond_to do |format|
      if @methodstep.update_attributes(params[:methodstep])
        flash[:notice] = 'Methodstep was successfully updated.'
        format.html { redirect_to(@methodstep) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @methodstep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /methodsteps/1
  # DELETE /methodsteps/1.xml
  def destroy
    @methodstep = Methodstep.find(params[:id])
    @methodstep.destroy

    respond_to do |format|
      format.html { redirect_to(methodsteps_url) }
      format.xml  { head :ok }
    end
  end
end
