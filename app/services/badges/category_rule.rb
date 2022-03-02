module Badges
  class CategoryRule < AbstractionsRule
    def satisfies?
      (user_tests_count % tests_count).zero?
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
