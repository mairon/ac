class Admin::CompaniesController < AdminController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_filter :load_resources, only: %w(new create edit update)

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
    @company.schedules.build
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to admin_companies_url }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to admin_companies_url }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url }
    end
  end

  private
    def load_resources
      @currencies = Currency.includes(:companies)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:currency_id, :unit, :name, :avatar, :telephone, :longitude, :latitude, :city_id, :country_id, :state_id, :about, :address, :website, :schedule_id, :user_id, :telephone02, schedules_attributes: [:id, :weekday, :in, :to ], currency_ids: [])
    end
end
