class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.string :attr_name
      t.integer :min
      t.integer :max
      t.string :attr_name_eff
      t.integer :value_eff
      t.references :valera_action, null: false, foreign_key: true

      t.timestamps
    end
  end
end
