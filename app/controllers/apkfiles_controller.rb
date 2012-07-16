class ApkfilesController < ApplicationController
  # GET /apkfiles
  # GET /apkfiles.json
  def index
    @apkfiles = Apkfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apkfiles }
    end
  end

  def download
	  send_file params[:id]
		  end




  # GET /apkfiles/1
  # GET /apkfiles/1.json
  def show
    @apkfile = Apkfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apkfile }
    end
  end

  # GET /apkfiles/new
  # GET /apkfiles/new.json
  def new
    @apkfile = Apkfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apkfile }
    end
  end

  # GET /apkfiles/1/edit
  def edit
    @apkfile = Apkfile.find(params[:id])
  end

  # POST /apkfiles
  # POST /apkfiles.json
  def create
    @apkfile = Apkfile.new(params[:apkfile])

    respond_to do |format|
      if @apkfile.save
        format.html { redirect_to @apkfile, notice: 'Apkfile was successfully created.' }
        format.json { render json: @apkfile, status: :created, location: @apkfile }
      else
        format.html { render action: "new" }
        format.json { render json: @apkfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apkfiles/1
  # PUT /apkfiles/1.json
  def update
    @apkfile = Apkfile.find(params[:id])

    respond_to do |format|
      if @apkfile.update_attributes(params[:apkfile])
        format.html { redirect_to @apkfile, notice: 'Apkfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apkfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apkfiles/1
  # DELETE /apkfiles/1.json
  def destroy
    @apkfile = Apkfile.find(params[:id])
    @apkfile.destroy

    respond_to do |format|
      format.html { redirect_to apkfiles_url }
      format.json { head :no_content }
    end
  end
end
