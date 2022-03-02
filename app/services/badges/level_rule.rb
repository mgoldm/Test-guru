module Badges
  class LevelRule < AbstractionsRule
    def satisfies?
      if tests_count == user_tests_count
        true
      else
        false
      end
    end

    private

    def tests_count
      Test.where(level: @badge.param).count
    end

    def user_tests_count
      @result.user.tests.where(level: @badge.param).distinct.count
    end
  end
end
