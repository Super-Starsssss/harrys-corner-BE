class User < ApplicationRecord
	attr_accessor :activation_token
	validates :name, :password, :email, presence: true
	validates :email, uniqueness: true
	before_save :create_activation_token
	has_secure_password


	def self.digest string
		cost = if ActiveModel::SecurePassword.min_cost
     	BCrypt::Engine::MIN_COST
   	else
     	BCrypt::Engine.cost
   	end
   		BCrypt::Password.create string, cost: cost
	end

	class << self
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def send_activation_mail
  	UserMailer.account_activation(self).deliver_now
  end

  def create_activation_token 
  	self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_attribute :activated, true
    update_attribute :activated_at, Time.zone.now
  end
end
