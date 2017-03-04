class Group < ApplicationRecord
  has_many :messages
  has_many :users_groups
  has_many :users, through: :users_groups

  validates :name,  presence: true

  def search_name
    User.where(name: 'Eren Yeager')
  end
end
