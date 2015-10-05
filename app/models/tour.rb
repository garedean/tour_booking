class Tour < ActiveRecord::Base
  belongs_to :tour_type
  has_and_belongs_to_many :amenities

  validates :tour_type,
            :requester_email,
            presence: true
  validates_format_of :requester_email, :with => /@/

  validates :requester_first_name,
            :requester_last_name,
            :requester_phone_number,
            presence: true,
            if: :booked_or_user_details?

  def booked?
    status == 'booked'
  end

  def booked_or_user_details?
    status.include?('user_details') || booked?
  end
end
