class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.integer :authorid
      t.string :name
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
