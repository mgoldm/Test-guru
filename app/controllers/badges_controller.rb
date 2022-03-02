class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @hide_badges = @badges.hidden_badges(current_user)
  end
end

