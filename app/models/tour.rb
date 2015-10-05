class Tour < ActiveRecord::Base
  belongs_to :tour_type
  has_and_belongs_to_many :amenities

  validates :tour_type, :requester_email, presence: true
  validates_format_of :requester_email, :with => /@/
end
