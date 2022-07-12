class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: 'not found'}, status: :not_found
        end
    end

    def create
        render json: Plant.create(permitted_plants), status: :created
    end

    private

    def permitted_plants
        params.permit(:name, :image, :price)
    end
end
