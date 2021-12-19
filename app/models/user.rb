class User < ApplicationRecord
  def users(level)
    Test.joins('JOIN results on tests.id=results.test_id').where(results: {user_id: id}, tests: {level: level})
  end
end
