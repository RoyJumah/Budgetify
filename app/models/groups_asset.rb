class GroupsAsset < ApplicationRecord
  belongs_to :group
  belongs_to :asset
end
