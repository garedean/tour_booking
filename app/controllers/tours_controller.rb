class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(
      tour_type_id:    tour_params[:tour_type],
      requester_email: tour_params[:requester_email])

    if @tour.save
      UserMailer.activation_email(@tour).deliver

      redirect_to :back, notice: "Please check your email to finish booking your tour."
    else
      render :new
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:tour_type, :requester_email, :rating)
  end
end
