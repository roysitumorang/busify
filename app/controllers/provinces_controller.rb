class ProvincesController < ApplicationController
  before_action :set_province, only: [:show, :edit, :update]
  before_action :set_provinces_breadcrumb
  before_action :set_province_breadcrumb, only: [:show, :edit, :update]

  # GET /provinces
  # GET /provinces.json
  def index
    @provinces = Province.paginate(:page => params[:page], :per_page => PER_PAGE).order(:name)
  end

  # GET /provinces/1
  # GET /provinces/1.json
  def show
  end

  # GET /provinces/new
  def new
    @province = Province.new
    add_breadcrumb :new, new_province_path
  end

  # GET /provinces/1/edit
  def edit
    add_breadcrumb :edit, edit_province_path(@province.slug)
  end

  # POST /provinces
  # POST /provinces.json
  def create
    @province = Province.new(province_params)
    redirect_to provinces_path, notice: "#{_('Province')} #{_('was successfully')} #{_('created')}." and return if @province.save
    add_breadcrumb :new, new_province_path
    render :new
  end

  # PATCH/PUT /provinces/1
  # PATCH/PUT /provinces/1.json
  def update
    redirect_to provinces_path, notice: "#{_('Province')} #{_('was successfully')} #{_('updated')}." and return if @province.update(province_params)
    add_breadcrumb :edit, edit_province_path(@province.slug)
    render :edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province
      begin
        @province = Province.where(['id = ? OR slug = ?', params[:id].to_i, params[:id]]).first!
      rescue
        respond_to do |format|
          format.html { redirect_to provinces_url, notice: "#{_('Province')} #{_('was not found')}." }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def province_params
      params.require(:province).permit(:name)
    end

    def set_provinces_breadcrumb
      add_breadcrumb :provinces
    end

    def set_province_breadcrumb
      add_breadcrumb @province.name, province_cities_path(@province.slug)
    end
end
