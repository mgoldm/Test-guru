class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def user_tests(level)
    tests.where(level: level)
  end
end
