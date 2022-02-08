class GistsController < ApplicationController
  def create
    @result = current_user.results.last
    result = GistQuestionService.new(@result.current_question).call

    if result.success?
      Gist.create!(url: result.url, question_id: @result.current_question.id, user_id: current_user.id)
      flash[:notice] = result.url
    else
      flash[:failure] = t('result.gists.create.failure')
    end

    redirect_to @result
  end
end
