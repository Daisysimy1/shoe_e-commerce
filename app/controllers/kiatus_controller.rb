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
        shoes = Kiatu.all 
        app_response(status_code: 200, body: shoes)
    end
    def update_shoe
        shoes = Kiatu.find(params[:shoes_id])
        app_response(status_code: 404, message: "Invalid shoe") unless shoes.valid?
        shoes.update(shoe_params)
        app_response(status_code: 200, message: "Updated successfully", body: shoes)
    end
    def delete_shoe 
        shoes = Kiatu.find(params[:shoes_id])
        app_response(status_code: 404, message: "Invalid shoe") unless shoes.valid?
        shoes.destroy(shoe_params)
        app_response(status_code: 200, message: "Deleted successfully")
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
