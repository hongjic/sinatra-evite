class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |registra|
      registra.references :people
      registra.references :events
      registra.string :status, :null => false, :limit =>15, :default => "maybe"
    end
  end
end
