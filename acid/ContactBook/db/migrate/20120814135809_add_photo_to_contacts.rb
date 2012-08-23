class AddPhotoToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :photo_file_name, :string
    add_column :contacts, :photo_content_type, :string
    add_column :contacts, :photo_file_size, :integer
  end

   def self.up
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
  end
  
end
