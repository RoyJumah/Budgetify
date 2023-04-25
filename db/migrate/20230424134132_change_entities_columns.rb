class ChangeEntitiesColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :entities, :user_id, :bigint

    add_foreign_key :entities, :users, column: :authorid
  end
end
