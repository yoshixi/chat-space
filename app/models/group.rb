class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, through: :users_groups

  accepts_nested_attributes_for :users_groups
  validates :name,  presence: true
end
