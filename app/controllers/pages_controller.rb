class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :landing ]

  def landing
    @trip = Trip.new
    @categories = Category.all.map do |category|
      category.name
    end
  end
end
