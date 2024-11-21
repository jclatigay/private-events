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

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_id)
  end
end
