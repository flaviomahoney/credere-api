class Api::V1::CoordinatesController < Api::V1::BaseController
    before_action :set_coordinate, only: [ :result ]
    def show

    end

    
    def create
        @coordinate = Coordinate.new(coordinate_params)
        @coordinate.user = current_user
        authorize @coordinate
        if @coordinate.save
            render :show, status: :created
        else
            render_error
        end
    end

    def result
    end

    private

    def set_coordinate
        @coordinate = Coordinate.find(params[:id])
        authorize @coordinate
    end

    def coordinate_params
        params.require(:coordinate).permit(:movimento)
    end

    def render_error
        render json: { errors: "Um movimento inválido foi detectado, infelizmente a sonda ainda não possui a habilidade de #vvv" },
        status: :unprocessable_entity
    end
end