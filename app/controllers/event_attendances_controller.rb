class EventAttendancesController < ApplicationController

    before_action :require_user
    before_action :set_event

    def create
       @event.event_attendances.create!(user: current_user)
       flash[:success] = "Glad you liked it"
       redirect_to @event
    end

    def destroy
       attend = current_user.event_attendances.find(params[:id])
       attend.destroy

       flash[:danger] = "Sorry for not attending"
       redirect_to @event
    end

private

    def set_event
        @event = Event.find(params[:event_id])
    end

end