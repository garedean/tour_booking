class UserMailer < ApplicationMailer
  default from: "oregontours@test.com"

  def activation_email(tour)
    @tour = tour
    mail to: tour.requester_email, subject: "Finish Booking your Tour"
  end

  def success_client_email(tour)
    @tour = tour
    mail to: tour.requester_email, subject: "Tour Booked"
  end

  def success_operator_email(tour)
    @tour = tour
    mail to: "tours@example.com", subject: "New Tour Scheduled"
  end
end
