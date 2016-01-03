class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]
  before_action :prepare_form_data, only: [:new, :create, :edit, :update]
  before_action :set_companies_breadcrumb
  before_action :set_company_breadcrumb, only: [:show, :edit, :update]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.paginate(:page => params[:page], :per_page => PER_PAGE).order(:name)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    add_breadcrumb :new, new_company_path
  end

  # GET /companies/1/edit
  def edit
    add_breadcrumb :edit, edit_company_path(@company.slug)
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_path(@company.slug), notice: "#{_('Company')} #{_('was successfully')} #{_('created')}." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html {
          add_breadcrumb :new, new_company_path
          render :new
        }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_path(@company.slug), notice: "#{_('Company')} #{_('was successfully')} #{_('updated')}." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html {
          add_breadcrumb :edit, edit_company_path(@company.slug)
          render :edit
        }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      begin
        @company = Company.where(['id = ? OR slug = ?', params[:id].to_i, params[:id]]).first!
      rescue
        respond_to do |format|
          format.html { redirect_to companies_url, notice: "#{_('Company')} #{_('was not found')}." }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address, :operator_type => [], :phone => [])
    end

    def prepare_form_data
      @operator_types = Company::OPERATOR_TYPES.map { |type| [type, type] }
    end

    def set_companies_breadcrumb
      add_breadcrumb :companies
    end

    def set_company_breadcrumb
      add_breadcrumb @company.name, company_path(@company.slug)
    end
end
