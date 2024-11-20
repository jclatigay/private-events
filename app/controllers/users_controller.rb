class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @created_events = Event.where(creator_id: current_user.id)
  end
end
