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

  def update
    @tour = get_tour
    @tour.update(tour_params)
    redirect_to :back, notice: "Thank you for rating, we look forward to your next tour!"
  end

  def rate_tour
    @tour = get_tour
  end

  private

  def tour_params
    params.require(:tour).permit(:tour_type, :requester_email, :rating)
  end

  def get_tour
    Tour.find(params[:id])
  end
end
