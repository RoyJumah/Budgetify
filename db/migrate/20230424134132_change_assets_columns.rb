class ChangeAssetsColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :user_id, :bigint

    add_foreign_key :assets, :users, column: :authorid
  end
end
