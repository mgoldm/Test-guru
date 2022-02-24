class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.category_rule = Test.where(category_id: @badge.category_rule).count
    @badge.level_rule = Test.where(level: @badge.level_rule).count

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :file_name, :category_rule, :level_rule, :test_rule)
  end
end
