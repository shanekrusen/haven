module ApplicationHelper
    def find_nearby_users(user)
      #new_lat = old_lat + (distance_in_km / radius_of_earth) * (I'm_not_sure)
      @low_lat = user.lat - (32.0 / 6378.0) * (180.0 / 3.14)
      @high_lat = user.lat + (32.0 / 6378.0) * (180.0 / 3.14)
      #new_lat = old_lat + (distance_in_km / radius_of_earth) * (I'm_not_sure) / (adjustment_for_size_of_long_at_lat)
      @low_long = user.long - (32.0 / 6378.0) * (180.0 / 3.14) / Math.cos(user.lat * 3.14 / 180.0)
      @high_long = user.long + (32.0 / 6378.0) * (180.0 / 3.14) / Math.cos(user.lat * 3.14 / 180)

      @nearby_user_lat = User.where(lat: @low_lat..@high_lat)
      @nearby_user_long = User.where(long: @low_long..@high_long)

      @nearby_users = @nearby_user_long & @nearby_user_lat

      return @nearby_users
    end
end
