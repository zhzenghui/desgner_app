class AddAttachmentAvatarToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :avatar
  end

  def self.down
    remove_attachment :posts, :avatar
  end
end
