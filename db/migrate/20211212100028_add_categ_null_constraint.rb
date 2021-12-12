class AddCategNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :category, false)
  end
end
