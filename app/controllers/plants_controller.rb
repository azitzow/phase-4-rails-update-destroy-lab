class PlantsController < ApplicationController
  before_action :find_plant, only: [:show, :update, :destroy]
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    render json: @plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # UPDATE /plants/:id
  def update
    @plant.update(plant_params)
    render json: @plant, status: :ok
  end

  # DELETE /plants/:id
  def destroy
    @plant.destroy

    head :no_content
  end

  private

  def find_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
