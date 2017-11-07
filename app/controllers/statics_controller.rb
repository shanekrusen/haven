class StaticsController < ApplicationController
    before_action :authenticate_user, only: [:home]
    
    def home
        if @current_user.services.empty?
            redirect_to users_services_path
        end
    end
end
