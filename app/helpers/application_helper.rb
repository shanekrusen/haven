module ApplicationHelper
    def find_nearby_users(user)
      @low_lat = user.lat + (-32 / 6378) * (180 / Math::PI)
      @high_lat = user.lat + (32 / 6378) * (180 / Math::PI)
      @low_long = user.long + (-32 / 6378) * (180 / Math::PI) / Math.cos(user.lat * Math::PI / 180)
      @high_long = user.long + (32 / 6378) * (180 / Math::PI) / Math.cos(user.lat * Math::PI / 180)

      @nearby_user_lat = User.where(lat: @low_lat..@high_lat)
      @nearby_user_long = User.where(long: @low_long..@high_long)

      @nearby_users = @nearby_user_long & @nearby_user_lat

      return @nearby_users
    end
end
