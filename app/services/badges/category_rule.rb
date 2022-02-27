module Badges
  class CategoryRule < AbstractionsRule
    def satisfies?
      if user_tests_count % tests_count == 0
        true
      else
        false
      end
    end

    private

    def tests_count
      Test.where(category_id: @badge.param).count
    end

    def user_tests_count
      @result.user.tests.where(category_id: @badge.param).count
    end
  end
end
