class ApplicationController < ActionController::API
    helpers do
        # test for log in
        def current_user
            User.first
        end

        def logged_in?
            !!current_user
        end
    end
end
