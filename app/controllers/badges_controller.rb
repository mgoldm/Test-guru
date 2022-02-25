class BadgesController < ApplicationController
  def index
    @hide_badges = []
    @badges = current_user.badges

    Badge.all.each do |badge|
      @hide_badges << badge unless @badges.include?(badge)
    end
  end
end
