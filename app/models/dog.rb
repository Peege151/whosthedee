class Dog < ActiveRecord::Base
belongs_to :user
default_scope -> { order('created_at DESC') }
validates :user_id, presence: true
has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/dogsilo.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token) #:id => session[:user_id]
  end
# def self.search(search, current_user_id)
#   where(['primarybreed LIKE ? and user_id != ?', "%#{search}%", current_user_id])
# end
 def self.search(search, current_user_id)
   where('primarybreed LIKE ?', "%#{search}%").where.not(user_id: current_user_id)
 end
end
