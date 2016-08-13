class DeleteColumnsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :vatar_updated_at

  end
end
