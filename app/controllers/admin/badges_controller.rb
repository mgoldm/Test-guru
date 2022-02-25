class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.type_title.nil?
      @badge.type_title = @badge.param
      set_param_badge
    else
      set_param_badge
    end

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

  def set_param_badge
    if @badge.rule_type == 'Category'
      @badge.param = Test.where(category_id: @badge.type_title).count
    elsif @badge.rule_type == 'Level'
      @badge.param = Test.where(level: @badge.type_title).count
    else
      @badge.param = Test.where(id: @badge.type_title).count
    end
  end

  def badge_params
    params.require(:badge).permit(:title, :file_name, :rule_type, :type_title, :param)
  end
end
