class Api::V1::BaseController < ActionController::API
    after_action :verify_authorized, except: :index
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def user_not_authorized(exception)
        render json: {
        error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
        }, status: :unauthorized
    end

    def not_found(exception)
        render json: { error: "Um movimento inválido foi detectado, infelizmente a sonda ainda não possui a habilidade de #vvv" }, status: :not_found
    end
end