class RemoveImageDataFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :image_data, :text
  end
end
