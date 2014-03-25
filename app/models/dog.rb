class Dog < ActiveRecord::Base
belongs_to :user
default_scope -> { order('created_at DESC') }
validates :user_id, presence: true
has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/dogsilo.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
# attr_accessor :image
end
