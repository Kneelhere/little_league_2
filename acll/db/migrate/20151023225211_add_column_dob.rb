class AddColumnDob < ActiveRecord::Migration
  def change
  	add_column :kids, :dob, :date
  end
end
