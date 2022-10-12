class AuthenticationController < ApplicationController
    def create_account 
    end
    def login_account 
    end
    private 
    def create_params 
        params.permit(:name, :email, :passowrd, :display_picture, :type)
    end
end
