class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

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
    params.require(:badge).permit(:title, :file_name, :rule_type, :type_title, :param)
  end
end
