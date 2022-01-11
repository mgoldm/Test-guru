class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @tests = Test.find(params[:id])
    render plain: @tests.inspect
  end

  def start
    redirect_to root_path
  end

  def new

  end

  def create
    test = Test.create(test_params)

    render plain: test.inspect

  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
