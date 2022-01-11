class QuestionsController < ApplicationController

  before_action :find_questions

  rescue_from ActiveRecord::RecordNotFound , with: :rescue_with_question_not_found

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to @question
    else
      redirect_to new_test_question_path
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private

  def rescue_with_question_not_found
    render plain: 'Test was not found'
  end

  def find_questions
    @questions_of_test = Question.where("test_id= ?", params[:test_id])
  end

  def question_params
    params.require(:question).permit(:title, :test_id)
  end
end
