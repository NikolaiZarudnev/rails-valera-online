class CreateValeraActions < ActiveRecord::Migration[6.1]
  def change
    create_table :valera_actions do |t|
      t.string :name
      t.integer :health
      t.integer :alcohol
      t.integer :happy
      t.integer :tired
      t.integer :money

      t.timestamps
    end
  end
end
