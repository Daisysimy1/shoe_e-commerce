class KiatusController < ApplicationController
    before_action :authorize 
    before_action :authorize_potential_seller
    skip_before_action :authorize_potential_seller, only: [:list_shoes]

    #crud operations for shoes
    def create_shoe
        if valid_shoe_seller?
            user = User.find(session[:user_id])
            if user 
                shoe = user.kiatus.create(shoe_params)
                app_response(status_code: 201, message: "Created successfully", body: user)
            else 
                app_response(status_code: 401, message: "You don't have the permission to add a shoe to the store")

            end
        else
            app_response(status_code: 401, message: "You don't have the permission to add a shoe to the store", body: user)
            end
    end
    def list_shoes 
    end
    def update_shoe
    end
    private 
    def shoe_params 
        params.permit(:name, :qty, :size, :price, :color, :user_id, :description)
    end
    def valid_shoe_seller?
        if session[:user_type] == 0
            false
        else 
            true
        end
    end
end
