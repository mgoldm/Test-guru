class BadgeService
  def initialize (result)
    @badges = Badge.all
    @result = result
    @user = result.user
    @test = result.test
    @new_user_badges = []
  end

  Check = Struct.new(:new_badges, :user) do
    def success?
      count = 0
      new_badges.each do |badge|
        if user.badges.include?(badge)
          count = count + 1
        end
      end
      if count != 0
        true
      end
    end
  end

  def check_rules
    @badges.each do |badge|
      if badge.rule_type == 'Category'
        check_category(badge)
      elsif badge.rule_type == 'Level'
        check_level(badge)
      elsif badge.rule_type == 'First Test'
        check_first_test(badge)
      end
    end
    Check.new(@new_user_badges, @user)
  end

  def check_category(badge)
    count_tests = Test.where(category_id: badge.param).count
    count_user_tests = @user.tests.where(category_id: badge.param).count

    if count_user_tests % count_tests == 0
      give_badge(badge)
    end
  end

  def check_level(badge)
    count_tests = Test.where(level: badge.param).count
    count_user_tests = @user.tests.where(level: badge.param).count

    if count_tests == count_user_tests
      give_badge(badge)
    end
  end

  def check_first_test(badge)
    if @user.results.where(test_id: badge.param).count == 1
      give_badge(badge)
    end
  end

  private

  def give_badge(badge)
    @user.badges.push(badge)
    @new_user_badges << badge
  end
end
