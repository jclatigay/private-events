class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event_attendance = current_user.event_attendances.build(event_id: params[:event_id])

    if @event_attendance.save
      redirect_back(fallback_location: root_path, notice: "You are now attending this event.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to attend event")
    end
  end

  def destroy
    @event_attendance = EventAttendance.find(params[:id])
    @event_attendance.destroy
    redirect_back(fallback_location: root_path, notice: "You are no longer attending this event.")
  end
end
