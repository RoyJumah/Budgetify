class Asset < ApplicationRecord
  has_many :groups_assets, dependent: :destroy
  has_many :groups, through: :groups_assets
  belongs_to :user, foreign_key: 'authorid'

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

end
