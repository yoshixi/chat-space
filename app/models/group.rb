class Group < ApplicationRecord
  has_many :messages
  has_many :users_groups
  has_many :users, through: :users_groups

  validates :name,  presence: true

  def self.search_name(word,current_user)
    User.where("name like '%" + word + "%'").where.not(id: current_user.id)
  end
end
