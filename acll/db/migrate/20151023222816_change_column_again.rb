class ChangeColumnAgain < ActiveRecord::Migration
  def change
  	remove_column :kids, :coach
  	remove_column :kids, :boolean
  end
end
