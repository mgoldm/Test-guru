class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_tests, only: %i[create new index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
    render plain: @questions.inspect
  end

  def show;end

  def new;end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @question
    else
      redirect_to new_test_question_path
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def rescue_with_question_not_found
    render plain: 'That question was not found'
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_tests
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
