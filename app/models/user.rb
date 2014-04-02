class User < ActiveRecord::Base
  include Amistad::FriendModel

  belongs_to :burrough
  belongs_to :city
  belongs_to :hood
  has_many :dogs, dependent: :destroy
  

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
### The next two lines must be commented out to seed the database
  has_secure_password
  validates :password, length: { minimum: 6 }
### after DB is seeded, re push to heroku with the above lines in!!

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/empty-user.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  acts_as_messageable
      

  geocoded_by :zip_code   # can also be an IP address
  after_validation :geocode 
  searchable do
    string :name
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end