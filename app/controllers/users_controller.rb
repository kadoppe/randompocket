class UsersController < ApplicationController
  before_filter :authenticate_user!

  def fetching
    render json: {fetching: current_user.fetching}
  end
end
