module Badges
  class FirstTestRule < AbstractionsRule
    def satisfies?
      if user_tests_count == 1
        true
      else
        false
      end
    end

    private

    def user_tests_count
      @result.user.tests.where(id: @badge.param).count
    end
  end
end
