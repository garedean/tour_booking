class TourStepsController < ApplicationController
  include Wicked::Wizard
  steps :user_details, :booking_details

  def show
    @tour = get_tour
    render_wizard
  end

  def update
    @tour = get_tour
    final_params = tour_step_params.merge!(status: step.to_s)
    final_params = tour_step_params.merge!(status: 'booked', ip_address: request.remote_ip) if step == steps.last

    @tour.attributes = final_params

    render_wizard @tour
  end

  private

  def tour_step_params
    params.require(:tour).permit(
      :requester_first_name,
      :requester_last_name,
      :requester_phone_number)
  end

  def get_tour
    Tour.find(params[:tour_id])
  end
end
