class Group < ApplicationRecord
  has_many :groups_assets, class_name: 'GroupsAsset', dependent: :destroy
  has_many :assets, through: :groups_assets
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
