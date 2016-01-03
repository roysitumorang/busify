class BusTypesController < ApplicationController
  before_action :set_bus_type, only: [:show, :edit, :update]
  before_action :prepare_form_data, only: [:new, :create, :edit, :update]
  before_action :set_bus_types_breadcrumb
  before_action :set_bus_type_breadcrumb, only: [:show, :edit, :update]

  # GET /bus_types
  # GET /bus_types.json
  def index
    @bus_types = BusType.paginate(:page => params[:page], :per_page => PER_PAGE).order(:name)
  end

  # GET /bus_types/1
  # GET /bus_types/1.json
  def show
  end

  # GET /bus_types/new
  def new
    @bus_type = BusType.new
    add_breadcrumb :new, new_bus_type_path
  end

  # GET /bus_types/1/edit
  def edit
    add_breadcrumb :edit, edit_bus_type_path(@bus_type.slug)
  end

  # POST /bus_types
  # POST /bus_types.json
  def create
    @bus_type = BusType.new(bus_type_params)

    respond_to do |format|
      if @bus_type.save
        format.html { redirect_to bus_type_path(@bus_type.slug), notice: "#{_('Bus type')} #{_('was successfully')} #{_('created')}." }
        format.json { render :show, status: :created, location: @bus_type }
      else
        format.html {
          add_breadcrumb :new, new_bus_type_path
          render :new
        }
        format.json { render json: @bus_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_types/1
  # PATCH/PUT /bus_types/1.json
  def update
    respond_to do |format|
      if @bus_type.update(bus_type_params)
        format.html { redirect_to bus_type_path(@bus_type.slug), notice: "#{_('Bus type')} #{_('was successfully')} #{_('updated')}." }
        format.json { render :show, status: :ok, location: @bus_type }
      else
        format.html {
          add_breadcrumb :edit, edit_bus_type_path(@bus_type.slug)
          render :edit
        }
        format.json { render json: @bus_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_type
      begin
        @bus_type = BusType.where(['id = ? OR slug = ?', params[:id].to_i, params[:id]]).first!
      rescue
        respond_to do |format|
          format.html { redirect_to bus_types_url, notice: "#{_('Bus type')} #{_('was not found')}." }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_type_params
      params.require(:bus_type).permit(:name, :capacity, :left, :right, :facility => [])
    end

    def set_bus_types_breadcrumb
      add_breadcrumb :bus_types
    end

    def set_bus_type_breadcrumb
      add_breadcrumb @bus_type.name, bus_type_path(@bus_type.slug)
    end

    def prepare_form_data
      @seat_formation = {left: [], right: []}
      1.upto(3) do |i|
        @seat_formation.keys.each { |key| @seat_formation[key] << [i, i.to_s] }
      end
      @facilities = BusType::FACILITIES.map { |i| [i, i] }
    end
end
