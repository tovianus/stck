class StckRequestsController < ApplicationController
skip_authorization_check
  # GET /stck_requests
  # GET /stck_requests.json
  def index
    @stck_requests = StckRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stck_requests }
    end
  end

  # GET /stck_requests/1
  # GET /stck_requests/1.json
  def show
    @stck_request = StckRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stck_request }
    end
  end

  # GET /stck_requests/new
  # GET /stck_requests/new.json
  def new
    @stck_request = StckRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stck_request }
    end
  end

  # GET /stck_requests/1/edit
  def edit
    @stck_request = StckRequest.find(params[:id])
  end

  # POST /stck_requests
  # POST /stck_requests.json
  def create
    @stck_request = StckRequest.new(params[:stck_request])

    respond_to do |format|
      if @stck_request.save
        format.html { redirect_to @stck_request, notice: 'Stck request was successfully created.' }
        format.json { render json: @stck_request, status: :created, location: @stck_request }
      else
        format.html { render action: "new" }
        format.json { render json: @stck_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stck_requests/1
  # PUT /stck_requests/1.json
  def update
    @stck_request = StckRequest.find(params[:id])

    respond_to do |format|
      if @stck_request.update_attributes(params[:stck_request])
        format.html { redirect_to @stck_request, notice: 'Stck request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stck_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stck_requests/1
  # DELETE /stck_requests/1.json
  def destroy
    @stck_request = StckRequest.find(params[:id])
    @stck_request.destroy

    respond_to do |format|
      format.html { redirect_to stck_requests_url }
      format.json { head :no_content }
    end
  end
end
