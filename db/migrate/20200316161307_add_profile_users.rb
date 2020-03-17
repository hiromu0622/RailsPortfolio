class AddProfileUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :string
    add_column :users, :profile_photo, :string
  end
end
