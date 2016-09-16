class Event < ActiveRecord::Base
  has_many :registrations, inverse_of: :events
  validates :name, presence: true
end