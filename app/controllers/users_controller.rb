class UsersController < ApplicationController
  def show
    @trips = current_user
  end
end
