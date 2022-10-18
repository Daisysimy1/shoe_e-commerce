class ApplicationController < ActionController::API
    include ActionController::Cookies
    wrap_parameters format: []

    #application response body
    def app_response(status_code: 200, message: "success", body: nil)
        render json: {
            status: status_code,
            message: message, 
            body: body 
        }, status: status_code
        end

        def authorize 
            return app_response(status_code: 401, message: "You are not authorized") unless session.include? :user_id
        end
        def authorize_potential_seller
            return app_response(status_code: 401, message: "You can not perform that action") unless session[:user_type] == "seller" || session[:user_type] == "admin"
        end
end
