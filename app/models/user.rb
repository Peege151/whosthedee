class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  	attr_accessor :name, :email, :password
  	  validates :name, presence: true, length: { maximum: 50, minimum: 4}
  	  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

end
