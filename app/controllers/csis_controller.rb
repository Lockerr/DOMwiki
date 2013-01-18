class CsisController < ApplicationController
  # GET /csis
  # GET /csis.json
  def index
    @csis = Csi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @csis }
    end
  end

  # GET /csis/1
  # GET /csis/1.json
  def show
    @csi = Csi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @csi }
    end
  end

  # GET /csis/new
  # GET /csis/new.json
  def new
    @csi = Csi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @csi }
    end
  end

  # GET /csis/1/edit
  def edit
    @csi = Csi.find(params[:id])
  end

  # POST /csis
  # POST /csis.json
  def create
    @csi = Csi.new(params[:csi])

    respond_to do |format|
      if @csi.save
        format.html { redirect_to @csi, notice: 'Csi was successfully created.' }
        format.json { render json: @csi, status: :created, location: @csi }
      else
        format.html { render action: "new" }
        format.json { render json: @csi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /csis/1
  # PUT /csis/1.json
  def update
    @csi = Csi.find(params[:id])

    respond_to do |format|
      if @csi.update_attributes(params[:csi])
        format.html { redirect_to @csi, notice: 'Csi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @csi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csis/1
  # DELETE /csis/1.json
  def destroy
    @csi = Csi.find(params[:id])
    @csi.destroy

    respond_to do |format|
      format.html { redirect_to csis_url }
      format.json { head :no_content }
    end
  end
end
