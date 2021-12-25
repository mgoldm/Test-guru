class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, presence: true

  scope :all_category, -> {order(title: :desc)}
end