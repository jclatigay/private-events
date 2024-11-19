class UsersController < ApplicationController
  def show
    @created_events = Event.where(creator_id: current_user.id)
  end
end
