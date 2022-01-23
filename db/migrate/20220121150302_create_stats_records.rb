class CreateStatsRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :stats_records do |t|
      t.string :name
      t.integer :money

      t.timestamps
    end
  end
end
