class QuestionsController < ApplicationController

  before_action :find_questions
  skip_before_action :find_questions, only: %i[destroy]

  rescue_from ActionController::UrlGenerationError, with: :rescue_with_question_not_found

  def index
  end

  def show
    @current_question = @list_of_questions[params[:id].to_i - 1]
  end

  def new

  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @current_question = Question.find(params[:id])
    @current_question.destroy

    redirect_to root_path
  end

  private

  def rescue_with_question_not_found
    render plain: 'Test was not found'
  end

  def find_questions
    @list_of_questions = Question.where("test_id= ?", params[:test_id])
  end

  def question_params
    params.require(:question).permit(:title, :test_id)
  end
end
