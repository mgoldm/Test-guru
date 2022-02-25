class BadgeService
  def initialize (result, badges)
    @badges = badges
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
      if count == user.badges.count and count!=0
        true
      end
    end
  end

  def check_rules
    @badges.each do |badge|
      if badge.rule_type == 'Category'
        give_badge(badge) if badge.param == @user.tests.where(category_id: badge.type_title).count
      elsif badge.rule_type == 'Level'
        give_badge(badge) if badge.param == @user.tests.where(level: badge.type_title).count
      elsif badge.rule_type == 'First Test'
        give_badge(badge) if badge.param == @result.test_id and @user.result.where(test_id: badge.param).count == 1
      end
    end
    Check.new(@new_user_badges, @user)
  end

  private

  def give_badge(badge)
    unless @user.badges.include?(badge)
      @user.badges.push(badge)
      @new_user_badges << badge
    end
  end
end
