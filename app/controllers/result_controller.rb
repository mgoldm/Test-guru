class ResultController < ApplicationController

  before_action :authenticate_user!
  before_action :set_result, only: %i[show update user_result]
  before_action :set_test, only: %i[user_result show update]

  def show; end

  def user_result
    @badges=Badge.all
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to user_result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def set_test
    @test = Test.find(@result.test_id)
  end
end
