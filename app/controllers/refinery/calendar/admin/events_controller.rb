module Refinery
  module Calendar
    module Admin
      class EventsController < ::Refinery::AdminController

        before_action :find_venues, except: [:index, :destroy]


        crudify :'refinery/calendar/event',
                sortable: false,
                order: 'starts_at ASC'

        def duplicate
          @existing_event = Event.find(params[:id])
          #create new object with attributes of existing record
          @event = @existing_event.dup
          render :edit
        end

        protected

        def event_params
          params.require(:event).permit(permitted_event_params)
        end

        private

        def find_venues
          @venues = Venue.order('name')
        end

        def permitted_event_params
          [
            :title, :from, :from_date, :from_time, :to, :to_date, :to_time, :registration_link,
            :venue_id, :excerpt, :description,
            :featured, :position,
            images_attributes: [:id, :caption, :image_page_id]
          ]
        end
      end
    end
  end
end
