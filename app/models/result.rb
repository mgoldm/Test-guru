class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user

  has_many :users, dependent: :destroy
  has_many :tests, dependent: :destroy
end
