class BadgeService
  RULES = {
    category: Badges::CategoryRule,
    level: Badges::LevelRule,
    firstTest: Badges::FirstTestRule

  }.freeze

  def initialize (result)
    @badges = Badge.all
    @result = result
    @user = result.user
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

  def call
    @badges.each do |badge|
      rule = RULES[:"#{badge.rule_type}"].new(badge, @result)
      @new_user_badges << badge if rule.satisfies?
    end
    give_badge
    Check.new(@new_user_badges, @user)
  end

  private

  def give_badge
    @user.badges.push(@new_user_badges)
  end
end
