class ApksController < ApplicationController
  # GET /apks
  # GET /apks.json
  def index
    @apks = Apk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apks }
    end
  end

  # GET /apks/1
  # GET /apks/1.json
  def show
    @apk = Apk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apk }
    end
  end

  # GET /apks/new
  # GET /apks/new.json
  def new
    @apk = Apk.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apk }
    end
  end

  # GET /apks/1/edit
  def edit
    @apk = Apk.find(params[:id])
  end

  # POST /apks
  # POST /apks.json
  def create
    @apk = Apk.new(params[:apk])
    test = @apk.save
    respond_to do |format|
      if test
        format.html { redirect_to @apk, notice: 'Apk was successfully created.' }
        format.json { render json: @apk, status: :created, location: @apk }
      else
        format.html { render action: "new" }
        format.json { render json: @apk.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /apks/1
  # PUT /apks/1.json
  def update
    @apk = Apk.find(params[:id])

    respond_to do |format|
      if @apk.update_attributes(params[:apk])
        format.html { redirect_to @apk, notice: 'Apk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apks/1
  # DELETE /apks/1.json
  def destroy
    @apk = Apk.find(params[:id])
    @apk.destroy

    respond_to do |format|
      format.html { redirect_to apks_url }
      format.json { head :no_content }
    end
  end
end
