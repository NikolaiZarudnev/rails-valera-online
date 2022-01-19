class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.integer :health
      t.integer :alcohol
      t.integer :happy
      t.integer :tired
      t.integer :money
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
