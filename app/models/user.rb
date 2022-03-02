class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :confirmable,
         :validatable

  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :gists, dependent: :destroy
  has_many :user_achievements, dependent: :destroy
  has_many :badges, through: :user_achievements

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "correct email" }

  def user_tests(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
