class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests, through: :results
  has_many :results, dependent: :destroy

  def show_users(level)
    Test.joins(:results)
        .where(results: { user_id: id }, tests: { level: level })
  end
end
