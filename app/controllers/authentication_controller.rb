class AuthenticationController < ApplicationController
    def create_account
        user = User.create(create_params)
        if user.valid?
            app_response(status_code: 201, message: "Account created successfully", body: user)
        else 
            app_response(status_code:422, message: "Invalid input", body: user.errors.full_messages)
        end
    end
    def login_account
    end
    private 
    def create_params 
        params.permit(:name, :email, :password, :display_picture, :user_type)
    end
end
