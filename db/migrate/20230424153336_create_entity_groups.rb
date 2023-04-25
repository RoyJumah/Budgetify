class CreateEntityGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_groups, &:timestamps
  end
end
