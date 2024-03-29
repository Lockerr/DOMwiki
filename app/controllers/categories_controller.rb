class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    if params[:category_id]
      @categories = Category.find(params[:category_id]).children
    else
      @categories = Category.where(:parent_id => nil)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    if names = params[:categories]
      name = names.split('/').last
      @category = Category.find_by_name name
    else
      @category = Category.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    params[:category_id] ? @category= Category.find(params[:category_id]).children.new : @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    if @category.level == 2
      @assessments = @category.assessments

      (4 - @assessments.size).times {
        @assessments << Assessment.new(:category_id => @category.id) 
      }

      @brands = @category.brands

      @mistakes = @category.mistakes

      (4 - @mistakes.size).times do
        @mistakes << Mistake.new(:category_id => @category.id)
      end


      render 'edit_subcategory', locals: {items: Item.all.map{|item| "[#{item.brand.name}] #{item.name}"}}
    else
      render 'edit'
    end
  end

  # POST /categories
  # POST /categories.json
  def create

    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        @category.pho
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_category_path(@category), alert: @category.errors}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
