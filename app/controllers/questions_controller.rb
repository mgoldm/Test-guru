class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy edit]
  before_action :find_tests, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
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
