class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :file_name, null: false
      t.string :rule_type, null: false
      t.string :type_title, null: false
      t.integer :param, null: false
      t.timestamps
    end
  end
end
