class Group < ApplicationRecord
  has_many :groups_entities
  has_many :entities, through: :groups_entities
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :icon, presence: true
end
