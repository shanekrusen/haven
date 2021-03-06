class User < ApplicationRecord
    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
    attr_accessor :password, :zip_code
    validates_presence_of :first_name, :last_name, :email, :password, :volunteer
    validates :password, :confirmation => :true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, uniqueness: true
    before_save :encrypt_password, :find_lat_long
    before_create { generate_token(:auth_token) }
    before_create :initialize_services
    after_save :clear_password
    serialize :services, Array

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
        if zip_code.present?
            @zip_codes = File.open("#{Rails.root}/app/assets/text/USZipCodesfrom2013GovernmentData.txt")
            @hash = {}

            @zip_codes.readlines.each do |line|
            @new_line = line.strip.split(",")
            @hash[@new_line[0]] = [@new_line[1], @new_line[2]]
            end

            self.lat = @hash[zip_code.to_s][0].to_f
            self.long = @hash[zip_code.to_s][1].to_f
        end
    end

    def initialize_services
        self.services = []
    end
end
