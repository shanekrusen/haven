class User < ApplicationRecord
    attr_accessor :password, :zip_code
    validates_presence_of :first_name, :last_name, :email, :password
    validates :password, :confirmation => :true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    before_save :encrypt_password, :find_lat_long
    before_create { generate_token(:auth_token) }
    after_save :clear_password

    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def clear_password
        self.password = nil
    end

    def self.authenticate(login_email="", login_password="")
        user = User.find_by_email(login_email)
        if user && user.match_password(login_password)
            return user
        else
            return false
        end
    end

    def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end

    def find_lat_long
        @zip_codes = File.open("#{Rails.root}/app/assets/text/USZipCodesfrom2013GovernmentData.txt")
        @hash = {}

        @zip_codes.readlines.each do |line|
          @new_line = line.split(",")
          @hash[@new_line[0]] = (@new_line[1] + "," + @new_line[2]).strip
        end
        puts zip_code
        puts @hash["08021"]

        self.lat_long = @hash[zip_code.to_s]
    end
end
