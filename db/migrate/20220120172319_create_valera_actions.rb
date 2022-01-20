class CreateValeraActions < ActiveRecord::Migration[6.1]
  def change
    create_table :valera_actions do |t|
      t.string :name
      t.string :cond_attr
      t.integer :min
      t.integer :max
      t.integer :health
      t.integer :alcohol
      t.integer :happy
      t.integer :tired
      t.integer :money
      t.string :change_eff_name
      t.integer :change_eff_value

      t.timestamps
    end
  end
end
