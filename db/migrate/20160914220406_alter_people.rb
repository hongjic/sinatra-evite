class AlterPeople < ActiveRecord::Migration
  def change
    remove_column :people, :info
    add_column :people, :birth, :date
    add_column :people, :gender, :boolean
    add_column :people, :zipcode, :integer
  end
end
