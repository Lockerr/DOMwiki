class OffersController < ApplicationController
  # GET /offers
  # GET /offers.json
  def brands
    if request.put?
      @offer = Offer.find(params[:id])
      @brand = Brand.find_by_name(params[:brand_name])
      if @brand
        unless @offer.brand_ids.include? @brand.id
          @offer.brands << @brand
          render partial: @brand, locals: {object: :offer}
        else
          render text: 'exist', status: :unprocessable_entity
        end
      else
        render :nothing
      end

    elsif request.delete?
      @offer = Offer.find(params[:id])
      @brand = Brand.find(params[:brand_id])
      @offer.brands.delete(@brand)
      render text: :ok, status: :ok
    end
  end

  def items
    if request.put?
      @offer = Offer.find(params[:id])
      @item = Item.find_by_name(params[:item_name].scan(/(\[.+\])\s+?(.+)/)[0][1])
      if @item
        unless @offer.item_ids.include? @item.id
          @offer.items << @item
          render partial: @item, locals: {object: :offer}
        else
          render text: 'exist', status: :unprocessable_entity
        end
      else
        render nothing: true
      end
    elsif request.delete?
      @offer = Offer.find(params[:id])
      @item = Item.find(params[:item_id])
      @offer.items.delete(@item)
      render text: :ok, status: :ok
    end
  end

  def index
    @offers = Offer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(params[:offer])

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end
end
