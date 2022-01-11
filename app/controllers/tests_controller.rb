class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    render plain: @tests.inspect
  end

  def new
  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect

  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @tests = Test.find(params[:id])
  end

end
