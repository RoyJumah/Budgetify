class Entity < ApplicationRecord
  has_many :groups_entities
  has_many :groups, through: :groups_entities
  belongs_to :user, foreign_key: 'authorid'

  validates :name, presence: true
  validates :amount, presence: true
  validates :authorid, presence: true
end
