class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.integer :zip_code
      t.boolean :league
      t.string :coach
      t.string :boolean
      t.integer :user_id
      t.integer :team_id
      t.string :guardian_first_name
      t.string :guardian_last_name

      t.timestamps null: false
    end
  end
end
