class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end
end
