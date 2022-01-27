require 'digest/sha1'

class User < ApplicationRecord

  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :email, uniqueness: true, format: { with: /\w*@\w*.{1}(com|ru){1}/, message: "correct email" }

  def user_tests(level)
    tests.where(level: level)
  end

  has_secure_password

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
