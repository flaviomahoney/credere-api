class Api::V1::CoordinatesController < Api::V1::BaseController
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
end