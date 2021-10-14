class Api::V1::ListsController < ApplicationController
    def index
        @lists = List.all
    
        render json: ListSerializer.new(@lists)
    end

    def create
        # @list = current_user.lists.build(list_params)
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
        @list = List.find_by(id: params["listId"])
        
        if @list.update(list_params)
          render json: ListSerializer.new(@list), status: :ok
        else
          resp = {
            error: @list.errors.full_messages.to_sentence
          }
          render json: resp, status: :unprocessable_entity
        end
    end

    def destroy 
      @list = List.find_by(id: params["id"]) 
      
      if @list.destroy
        render json: { data: "List deleted." }, status: :ok
      else
        error_resp = {
          error: "Unable to delete list."
        }
        render json: error_resp, status: :unprocessable_entity
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