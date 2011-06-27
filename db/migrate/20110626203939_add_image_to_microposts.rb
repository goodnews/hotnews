class AddImageToMicroposts < ActiveRecord::Migration
  def self.up
   add_column :microposts, :image_file_name, :string # Original filename
    add_column :microposts, :image_content_type, :string # Mime type
    add_column :microposts, :image_file_size, :integer # File size in bytes
   add_column :microposts, :image_updated_at, :datetime   
  end

  def self.down
    remove_column :microposts, :image_file_name
    remove_column :microposts, :image_content_type
    remove_column :microposts, :image_file_size
    remove_column :microposts, :image_updated_at
  end
end
