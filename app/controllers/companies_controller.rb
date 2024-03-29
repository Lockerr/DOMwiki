class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json

  def brands
    if request.put?
      @company = Company.find(params[:id])
      @brand = Brand.find_by_name(params[:brand_name])
      if @brand
        unless @company.brand_ids.include? @brand.id
          @company.brands << @brand
          render partial: @brand, locals: {object: :offer}
        else
          render text: 'exist', status: :unprocessable_entity
        end
      else
        render :nothing
      end

    elsif request.delete?
      @company = Company.find(params[:id])
      @brand = Brand.find(params[:brand_id])
      @offer.brands.delete(@brand)
      render text: :ok, status: :ok
    end
  end

  def categories
    if request.put?
      @company = Company.find(params[:id])
      @category = Category.find_by_name(params[:category_name])
      if @category
        unless @company.category_ids.include? @category.id
          @company.categories << @category
          render partial: @category, locals: {object: :offer}
        else
          render text: 'exist', status: :unprocessable_entity
        end
      else
        render nothing: true
      end
    elsif request.delete?
      @company = Company.find(params[:id])
      @category = Category.find(params[:category_id])
      @company.categories.delete(@category)
      render text: :ok, status: :ok
    end
  end

  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to edit_company_path(@company), notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
