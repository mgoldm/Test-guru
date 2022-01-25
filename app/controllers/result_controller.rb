class ResultController < ApplicationController

  before_action :set_result_and_counter, only: %i[show update user_result]
  before_action :set_test, only: %i[user_result show update]

  def show

  end

  def user_result

  end

  def update

    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to user_result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result_and_counter
    @result = Result.find(params[:id])
  end

  def set_test
    @test = Test.find(@result.test_id)
  end
end
