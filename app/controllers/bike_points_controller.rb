class BikePointsController < ApplicationController
  before_action :set_bike_point, only: %i[ show edit update destroy ]

  # GET /bike_points or /bike_points.json
  def index
    @bike_points = BikePoint.all
    @point = BikePoint.search_address(params[:search])
  end

  # GET /bike_points/1 or /bike_points/1.json
  def show
  end

  def search

  end

  # GET /bike_points/new
  def new
    @bike_point = BikePoint.new
  end

  # GET /bike_points/1/edit
  def edit
  end

  # POST /bike_points or /bike_points.json
  def create
    @bike_point = BikePoint.new(bike_point_params)

    respond_to do |format|
      if @bike_point.save
        format.html { redirect_to bike_point_url(@bike_point), notice: "Bike point was successfully created." }
        format.json { render :show, status: :created, location: @bike_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bike_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bike_points/1 or /bike_points/1.json
  def update
    respond_to do |format|
      if @bike_point.update(bike_point_params)
        format.html { redirect_to bike_point_url(@bike_point), notice: "Bike point was successfully updated." }
        format.json { render :show, status: :ok, location: @bike_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bike_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bike_points/1 or /bike_points/1.json
  def destroy
    @bike_point.destroy

    respond_to do |format|
      format.html { redirect_to bike_points_url, notice: "Bike point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike_point
      @bike_point = BikePoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bike_point_params
      params.require(:bike_point).permit(:district, :station, :code, :address, :number, :lat, :long, :search)
    end
end
