class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    if brand_name = params[:brand_name]
      @items = Brand.find_by_name(brand_name).items.includes(:brand)
    else
      @items = Item.includes(:brand)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
      format.js
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    if item_name = params[:item_name]
      @item = Item.find_by_name item_name
    else
      @item = Item.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.js
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        flash[:error] = @item.errors.full_messages.join('. ')
        format.html { render action: "new"}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
