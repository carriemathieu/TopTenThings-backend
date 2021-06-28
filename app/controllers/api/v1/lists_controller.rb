class Api::V1::ListsController < ApplicationController
    def index
        @lists = List.all
    
        render json: ListsSerializer.new(@lists)
    end

    def create
        @list = List.new(list_params)

        if @list.save
          render json: ListsSerializer.new(@list), status: :created
        else
          resp = {
            error: @list.errors.full_messages.to_sentence
          }
          render json: resp, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:list).permit(:category, :list_title, :last_content, :user_id)
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