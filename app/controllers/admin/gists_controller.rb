class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def create
    @result = current_user.results.last
    result = GistQuestionService.new(@result.current_question).call

    if result.success?
      Gist.create!(url: result.url, question_id: @result.current_question, user_id: current_user)
      flash[:notice]= result.url
    else
      flash[:failure]= t('result.gists.create.failure')
    end

    redirect_to @result
  end
end
