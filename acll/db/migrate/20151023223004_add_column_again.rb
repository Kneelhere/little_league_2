class AddColumnAgain < ActiveRecord::Migration
  def change
  	add_column :kids, :coach, :boolean, default:"false"
  end
end
