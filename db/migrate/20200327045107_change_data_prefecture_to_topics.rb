class ChangeDataPrefectureToTopics < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :prefecture, :integer
  end
end
