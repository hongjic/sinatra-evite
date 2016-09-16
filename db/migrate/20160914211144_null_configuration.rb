class NullConfiguration < ActiveRecord::Migration
  def change
    change_column :registrations, :people_id, :integer, :null => false
    change_column :registrations, :events_id, :integer, :null => false
  end
end