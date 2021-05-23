class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:session][:email])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            render json: @user
        else
            render json: {
                error: "Invalid Credentials"
            }
        end
    end
    
    #def
        
    #end

end