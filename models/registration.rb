class Registration < ActiveRecord::Base
  belongs_to :people
  belongs_to :events
  validates :people_id, :events_id, :status, presence: true
end