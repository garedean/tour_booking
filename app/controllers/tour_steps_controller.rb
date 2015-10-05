class TourStepsController < ApplicationController
  include Wicked::Wizard
  steps :user_details, :booking_details

  def show
    @tour = get_tour

    if @tour.status == 'booked'
      redirect_to rate_tour_tour_path(@tour)
    else
      render_wizard
    end
  end

  def updateclass TourStepsController < ApplicationController
  include Wicked::Wizard
  steps :user_details, :booking_details

  def show
    @tour = get_tour

    if @tour.status == 'booked'
      redirect_to rate_tour_tour_path(@tour)
    else
      render_wizard
    end
  end

  def update
    @tour = get_tour
    final_params = tour_step_params.merge!(status: step.to_s)
    final_params = tour_step_params.merge!(status: 'booked', ip_address: request.remote_ip) if step == steps.last

    @tour.attributes = final_params

    if params[:tour][:tour_complete]
      if @tour.save
        send_success_emails(@tour)
        redirect_to tour_booked_path
      else
        render_wizard
      end
    else
      render_wizard @tour
    end
  end

  private

  def tour_step_params
    params.require(:tour).permit(
      :requester_first_name,
      :requester_last_name,
      :requester_phone_number,
      :booking_date,
      :referrer,
      :special_requests,
      amenity_ids: [])
  end

  def get_tour
    Tour.find(params[:tour_id])
  end

  def send_success_emails(tour)
    UserMailer.success_client_email(tour).deliver
    UserMailer.success_operator_email(tour).deliver
  end
end

    @tour = get_tour
    final_params = tour_step_params.merge!(status: step.to_s)
    final_params = tour_step_params.merge!(status: 'booked', ip_address: request.remote_ip) if step == steps.last

    @tour.attributes = final_params

    if params[:tour][:tour_complete]
      if @tour.save
        redirect_to tour_booked_path
      else
        render_wizard
      end
    else
      render_wizard @tour
    end
  end

  private

  def tour_step_params
    params.require(:tour).permit(
      :requester_first_name,
      :requester_last_name,
      :requester_phone_number,
      :booking_date,
      :referrer,
      :special_requests,
      amenity_ids: [])
  end

  def get_tour
    Tour.find(params[:tour_id])
  end
end
