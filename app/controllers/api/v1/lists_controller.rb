class Api::V1::ListsController < ApplicationController
    def index
        @lists = List.all
    
        render json: ListSerializer.new(@lists)
    end

    def create
        @list = List.new(list_params)

        if @list.save
          render json: ListSerializer.new(@list), status: :created
        else
          resp = {
            error: @list.errors.full_messages.to_sentence
          }
          render json: resp, status: :unprocessable_entity
        end
    end

    def update
        # @list = List.find_by(id: params[list.id])
        # cat_id = params["category_id"].to_i
        # @category = Category.find_or_create_by(id: cat_id)

        if @list.update(list_params)
          render json: ListSerializer.new(@list), status: :updated
        else
          resp = {
            error: @list.errors.full_messages.to_sentence
          }
          render json: resp, status: :unprocessable_entity
        end
    end

    private

    def list_params
        params.require(:list).permit(:category_id, :list_title, :user_id, :list_content => [])
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