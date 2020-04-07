class CreateUserPrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :user_prefectures do |t|
      t.integer :user_id
      t.integer :prefecture

      t.timestamps
    end
  end
end
