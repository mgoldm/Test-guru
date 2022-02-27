class Badge < ApplicationRecord
  has_many :user_achievements, dependent: :destroy
  has_many :users, through: :user_achievements

  validates :file_name, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  scope :hidden_badges, ->(user) { where.not(id: user.badges) }
end
