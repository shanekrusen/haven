module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    
      def connect
        self.current_user = find_verified_user
        logger.add_tags 'ActionCable', @current_user.email
      end

      protected

      def find_verified_user
        if cookies[:auth_token]
          @current_user = User.find_by_auth_token!(cookies[:auth_token])
          return @current_user
        else
          reject_unauthorized_connection
        end
      end

  end
end
