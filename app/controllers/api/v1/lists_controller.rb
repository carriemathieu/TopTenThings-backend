class Api::V1::ListsController < ApplicationController
    def index
        @lists = List.all
    
        render json: @lists
    end
end

# def index
#     if logged_in?
#         @trips = current_user.trips
#         render json: @trips
#     else
#         render json: {
#             error: "You must be logged in to see trips"
#         }
#     end
# end