class PerusahaansController < ApplicationController
  skip_authorization_check

  # GET /perusahaans
  # GET /perusahaans.json
  def index
    @perusahaans = Perusahaan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perusahaans }
    end
  end

  # GET /perusahaans/1
  # GET /perusahaans/1.json
  def show
    @perusahaan = Perusahaan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perusahaan }
    end
  end

  # GET /perusahaans/new
  # GET /perusahaans/new.json
  def new
    @perusahaan = Perusahaan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perusahaan }
    end
  end

  # GET /perusahaans/1/edit
  def edit
    @perusahaan = Perusahaan.find(params[:id])
  end

  # POST /perusahaans
  # POST /perusahaans.json
  def create
    @perusahaan = Perusahaan.new(params[:perusahaan])

    respond_to do |format|
      if @perusahaan.save
        format.html { redirect_to @perusahaan, notice: 'Perusahaan was successfully created.' }
        format.json { render json: @perusahaan, status: :created, location: @perusahaan }
      else
        format.html { render action: "new" }
        format.json { render json: @perusahaan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perusahaans/1
  # PUT /perusahaans/1.json
  def update
    @perusahaan = Perusahaan.find(params[:id])

    respond_to do |format|
      if @perusahaan.update_attributes(params[:perusahaan])
        format.html { redirect_to @perusahaan, notice: 'Perusahaan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perusahaan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perusahaans/1
  # DELETE /perusahaans/1.json
  def destroy
    @perusahaan = Perusahaan.find(params[:id])
    @perusahaan.destroy

    respond_to do |format|
      format.html { redirect_to perusahaans_url }
      format.json { head :no_content }
    end
  end
end
