class User < ActiveRecord::Base
    before_save{ self.email = email.downcase }
#    before_create :create_remember_token

    has_many :trips_users
    has_many :trips, through: :trips_users
    has_many :trips_owned, :class_name => "Trip", :foreign_key => "owner_id"
    
    has_secure_password

#    def User.new_remember_token
#        SecureRandom.urlsafe_base64
#    end
#
#    def User.hash(token)
#        Digest::SHA1.hexdigest(token.to_s)
#    end
#
#    private
#      def create_remember_token
#        self.remeber_token = User.hash(User.new_remember_token)
#      end
end
