class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :tests, through: :results

  validates :name, presence: true
  validates :email, presence: true
end