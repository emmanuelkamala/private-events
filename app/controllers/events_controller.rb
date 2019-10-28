class EventsController < ApplicationController
  layout 'admin'
  
  def index
    @events = Event.all
  end

  def home
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end



  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
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
