class UserMailer < ApplicationMailer
  default from: "oregontours@test.com"

  def activation_email(tour)
    @tour = tour
    mail to: tour.requester_email, subject: "Finish Booking your Tour"
  end
end
