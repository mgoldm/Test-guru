class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :rule_type, null: false
      t.timestamps
    end
  end
end
