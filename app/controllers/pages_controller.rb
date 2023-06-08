class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :landing ]

  def landing
    @trip = Trip.new
  end
end
