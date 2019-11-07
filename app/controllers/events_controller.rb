class EventsController < ApplicationController
  layout 'admin'

  before_action :require_user, except: [:index, :show]
  
  def index
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 5)
    @past_events = Event.past.paginate(page: params[:page], per_page: 5)

  end

  def home
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 5)
    @past_events = Event.past.paginate(page: params[:page], per_page: 5)
  end

  def show
    @event = Event.find(params[:id])
  end



  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @event.user = current_user
      if @event.save
      flash[:success] = "Event created successfully"
      redirect_to(events_path)
      else
      render('new')
      end
  end

  def edit
   @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(events_params)
      flash[:success] = "Event updated successfully"
    redirect_to(event_path(@event))
    else
    render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:danger] = "Event '#{@event.title}' deleted successfully"
    redirect_to(events_path)
  end

  private

  def events_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
