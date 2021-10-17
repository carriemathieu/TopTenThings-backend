class Api::V1::ListsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_list, only: [:update, :destroy]
    before_action :redirect_if_not_list_author, only: [:update, :destroy]

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
        # @list = List.find_by(id: params["listId"])
        
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
      # @list = List.find_by(id: params["id"]) 
      # byebug
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

    def set_list
      @list = List.find_by(id: params[:id])
      if !@list || @list == nil
        error_resp = {
          error: "Unable to locate this list."
        }
        render json: error_resp, status: :unprocessable_entity
      end
  end

    def redirect_if_not_list_author
      if @list.user != current_user
        error_resp = {
          error: "You are not authorized to make changes to this list."
        }
        render json: error_resp, status: :unprocessable_entity
          # flash[:alert] = "You are not authorized to make changes to this list."
          # redirect_to list_path
      end
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