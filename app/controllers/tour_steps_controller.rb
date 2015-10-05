class TourStepsController < ApplicationController
  include Wicked::Wizard
  steps :user_details, :booking_details

  def show
    @tour = get_tour
    render_wizard
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
