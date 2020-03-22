class AttendancesController < ApplicationController
  def new; end

   def create
    f1 = Attendance.create(user_id: current_user.id, event_id: params[:id])
    f1.save
    redirect_to '/'
  end
end
