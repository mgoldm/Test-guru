class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show destroy edit update]
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
      redirect_to admin_test_path(@test)
    else
      redirect_to new_admin_test_question_path
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
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
