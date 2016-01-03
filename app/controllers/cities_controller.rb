class CitiesController < ApplicationController
  before_action :prepare_province
  before_action :set_city, only: [:edit, :update]
  before_action :set_cities_breadcrumb
  before_action :set_city_breadcrumb, only: [:edit, :update]

  # GET /cities
  # GET /cities.json
  def index
    @cities = @province.cities.paginate(:page => params[:page], :per_page => PER_PAGE).order(:name)
  end

  # GET /cities/new
  def new
    @city = @province.cities.new
    add_breadcrumb :new
  end

  # GET /cities/1/edit
  def edit
    add_breadcrumb :edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = @province.cities.new(city_params)
    redirect_to province_cities_path(@province.slug), notice: "#{_('City')} #{_('was successfully')} #{_('created')}." and return if @city.save
    add_breadcrumb :new
    render :new
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    redirect_to province_cities_path(@province.slug), notice: "#{_('City')} #{_('was successfully')} #{_('updated')}." and return if @city.update(city_params)
    add_breadcrumb :edit
    render :edit
  end

  private
    def prepare_province
      begin
        @province = Province.where(['id = ? OR slug = ?', params[:province_id].to_i, params[:province_id]]).first!
      rescue
        respond_to do |format|
          format.html { redirect_to provinces_url, notice: "#{_('Province')} #{_('was not found')}." }
          format.json { head :no_content }
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_city
      begin
        @city = @province.cities.where(['id = ? OR slug = ?', params[:id].to_i, params[:id]]).first!
      rescue
        redirect_to province_cities_url(@province.slug), notice: "#{_('City')} #{_('was not found')}."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :address, :operator_type => [], :phone => [])
    end

    def set_cities_breadcrumb
      add_breadcrumb :provinces
      add_breadcrumb @province.name, province_cities_path(@province.slug)
      add_breadcrumb :cities, province_cities_path(@province.slug)
    end

    def set_city_breadcrumb
      add_breadcrumb @city.name, '#'
    end
end
