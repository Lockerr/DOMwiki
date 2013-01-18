class MistakesController < ApplicationController
  # GET /mistakes
  # GET /mistakes.json
  def index
    @mistakes = Mistake.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mistakes }
    end
  end

  # GET /mistakes/1
  # GET /mistakes/1.json
  def show
    @mistake = Mistake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mistake }
    end
  end

  # GET /mistakes/new
  # GET /mistakes/new.json
  def new
    @mistake = Mistake.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mistake }
    end
  end

  # GET /mistakes/1/edit
  def edit
    @mistake = Mistake.find(params[:id])
  end

  # POST /mistakes
  # POST /mistakes.json
  def create
    @mistake = Mistake.new(params[:mistake])

    respond_to do |format|
      if @mistake.save
        format.html { redirect_to @mistake, notice: 'Mistake was successfully created.' }
        format.json { render json: @mistake, status: :created, location: @mistake }
      else
        format.html { render action: "new" }
        format.json { render json: @mistake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mistakes/1
  # PUT /mistakes/1.json
  def update
    @mistake = Mistake.find(params[:id])

    respond_to do |format|
      if @mistake.update_attributes(params[:mistake])
        format.html { redirect_to @mistake, notice: 'Mistake was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mistake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mistakes/1
  # DELETE /mistakes/1.json
  def destroy
    @mistake = Mistake.find(params[:id])
    @mistake.destroy

    respond_to do |format|
      format.html { redirect_to mistakes_url }
      format.json { head :no_content }
    end
  end
end
