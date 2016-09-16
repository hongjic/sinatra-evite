class Person < ActiveRecord::Base
  has_many :registrations, inverse_of: :people
  validates :name, presence: true, uniqueness: true
end
