class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |person|
      person.string :name, :null => false, :limit => 20, :default => "N/A"
      person.binary :info, :null => true
      # info is a serialized binary which contains information about 
      # data-of-birth, gender and zipcode
    end
  end
end
