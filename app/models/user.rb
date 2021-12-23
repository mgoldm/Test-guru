class User < ApplicationRecord
  has_many :tests, through: :results

  def users(level)
    Test.joins('JOIN results on tests.id=results.test_id').where(results: { user_id: id }, tests: { level: level })
  end
end
