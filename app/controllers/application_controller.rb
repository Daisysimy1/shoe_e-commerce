class ApplicationController < ActionController::API
    wrap_parameters format: []

    #application response body
    def app_response(status_code: 200, message: "success", body: nil)
        render json: {
            status: status_code,
            message: message, 
            body: body 
        }, status: status_code
        end
end
