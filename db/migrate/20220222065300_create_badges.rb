class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :file_name, null: false
      t.integer :category_rule, default: nil
      t.integer :level_rule, default: nil
      t.integer :test_rule, default: nil
      t.timestamps
    end
  end
end
