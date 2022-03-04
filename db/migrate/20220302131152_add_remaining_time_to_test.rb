class AddRemainingTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_remain, :integer
  end
end
