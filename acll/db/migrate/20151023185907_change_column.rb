class ChangeColumn < ActiveRecord::Migration
  def changeCoach
  	remove_column :kids, :coach
  	remove_column :kids, :boolean
  	change_column :kids, :coach, :boolean
  end
end
