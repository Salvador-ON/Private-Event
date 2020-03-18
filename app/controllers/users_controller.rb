class UsersController < ApplicationController
  def show
    @events = Event.where(user_id: current_user.id)
    @attendees = Attendance.where(user_id: current_user.id)
  end

  def new; end

  def create
    @user = User.new(name: params[:name],
                     email: params[:email])

    if @user.valid?
      @user.save
      redirect_to '/login'
    else
      flash[:danger] = 'form has invalid information'
      redirect_to '/signup'
    end
  end
end
