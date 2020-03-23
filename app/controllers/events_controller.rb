class EventsController < ApplicationController
  def new; end

  def index
    @events = Event.all
    @past = Event.all.past
    @upcoming = Event.all.upcoming
  end

  def create
    @event = current_user.events.build(description: params[:description],
                                       event_date: params[:event_date],
                                       location: params[:location])
    if @event.valid?
      @event.save
      redirect_to '/'
    else
      flash[:danger] = 'form has invalid information'
      redirect_to '/add_event'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = Attendance.where(event_id: params[:id])
  end
end
