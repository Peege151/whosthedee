class AddAttachmentImageToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :dogs, :image
  end
end
