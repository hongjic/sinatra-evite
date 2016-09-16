class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |event|
      event.string :name, :null => false, :limit => 50, :default =>"N/A"
      event.datetime :date
    end
  end
end
