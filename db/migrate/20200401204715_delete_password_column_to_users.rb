class DeletePasswordColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password, :string
    #passwordカラムを作ってからpassword_digestを作ってしまったため削除
  end
end
