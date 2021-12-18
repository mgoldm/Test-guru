class User < ApplicationRecord
  def users(level)
    Test.where(level: level)
  end
end
