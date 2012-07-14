class ApkclientsController < ApplicationController
  
    


  # GET /apkclients
  # GET /apkclients.json
  def index
    @apkclients = Apkclient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apkclients }
    end
  end

  # GET /apkclients/1
  # GET /apkclients/1.json
  def show
    @apkclient = Apkclient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apkclient }
    end
  end

  # GET /apkclients/new
  # GET /apkclients/new.json
  def new
    @apkclient = Apkclient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apkclient }
    end
  end

  # GET /apkclients/1/edit
  def edit
    @apkclient = Apkclient.find(params[:id])
  end

  # POST /apkclients
  # POST /apkclients.json
  def create
    @apkclient = Apkclient.new(params[:apkclient])
   

    respond_to do |format|
      if @apkclient.save
        format.html { redirect_to @apkclient, notice: 'Apkclient has been upload sucssessfully.' }
        format.json { render json: @apkclient, status: :created, location: @apkclient }
      else
        format.html { render action: "new" }
        format.json { render json: @apkclient.errors, status: :unprocessable_entity }
      end
    end
  end


  def upload
     uploaded_file = params[:apk_file]
     File.open(Rails.root.join('/swidy/client', '', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
        end
    end

  # PUT /apkclients/1
  # PUT /apkclients/1.json
  def update
    @apkclient = Apkclient.find(params[:id])

    respond_to do |format|
      if @apkclient.update_attributes(params[:apkclient])
         format       format.html { redirect_to @apkclient, notice: 'Apkclient was successfully updated.' }
ad
        uploaded_file = params[:apk_file]
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apkclient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apkclients/1
  # DELETE /apkclients/1.json
  def destroy
    @apkclient = Apkclient.find(params[:id])
    @apkclient.destroy

    respond_to do |format|
      format.html { redirect_to apkclients_url }
      format.json { head :no_content }
    end
  end
end
