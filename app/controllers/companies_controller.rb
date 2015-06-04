class CompaniesController < ApplicationController

  before_action :find_by_api_key, only: [:validate, :city_list, :details_for_dash, :drivers_list]
  before_action :set_city, only: [:details_for_dash]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  def validate
    render json: { is_valid: @company.present?, name: @company.name }, status: 200
  end

  def city_list
    if @company
      render json: { cities: @company.cities.as_json }, status: 200
    end
  end

  def drivers_list
    if @company
      render json: { drivers: @company.drivers.as_json }, status: 200
    end
  end

  def details_for_dash
    render json: ::DetailsForDashSerializer.new(@company.id, @city.id), status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def find_by_api_key
      @company = Company.find_by(api_key: params[:api_key])
    end

    def set_city
      @city = @company.cities.find_by(id: params[:city_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :city_ids => [])
    end
end
