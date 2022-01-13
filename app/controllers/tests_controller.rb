class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    render plain: @tests.inspect
  end

  def new
  end

  def create
    test = Test.new(test_params)
    if test.save
      render plain: test.inspect
    else
      redirect_to new_test_path
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @tests = Test.find(params[:id])
  end
end
