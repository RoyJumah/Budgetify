class EntityGroup < ApplicationRecord
  belongs_to 'Entity', foreign_key: 'entity_id'
  belongs_to 'Group', foreign_key: 'group_id'
end
