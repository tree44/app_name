class SystemsController < ApplicationController
  # GET /systems
  # GET /systems.json
  def index
    @systems = System.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @systems }
    end
  end

  # GET /systems/1
  # GET /systems/1.json
  def show
    @system = System.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system }
    end
  end

  # GET /systems/new
  # GET /systems/new.json
  def new
    #override new, if we already have a system 
    if System.all.empty?
      @system = System.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @system }
      end
    else
      respond_to do |format|
        flash[:notice] = "System has already been created."
        format.html { redirect_to systems_path }
        format.json { render json: @systems.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /systems/1/edit
  def edit
    @system = System.find(params[:id])
  end

  # POST /systems
  # POST /systems.json
  def create
    @system = System.new(params[:system])

    respond_to do |format|
      if @system.save
        format.html { redirect_to @system, notice: 'System was successfully created.' }
        format.json { render json: @system, status: :created, location: @system }
      else
        format.html { render action: "new" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /systems/1
  # PUT /systems/1.json
  def update
    @system = System.find(params[:id])

    respond_to do |format|
      if @system.update_attributes(params[:system])
        flash.now[:success] = "System was successfully updated."
        format.html { redirect_to @system }
        #proper response to http PUT is also no_content
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /systems/1
  # DELETE /systems/1.json
#  def destroy
#    @system = System.find(params[:id])
#    @system.destroy
#
#    respond_to do |format|
#      format.html { redirect_to systems_url }
#      format.json { head :no_content }
#    end
#  end

end
