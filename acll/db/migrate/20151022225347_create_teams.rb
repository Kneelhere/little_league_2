class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :coach1
      t.string :coach2
      t.string :coach3
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
