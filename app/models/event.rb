class Event < ApplicationRecord
  belongs_to :venue
  has_many :artist_events, dependent: :destroy
  has_many :artists, through: :artist_events

  REQUEST = EventsRequest


  
  def self.fetch(name)
    events_params = REQUEST.new(name).events
    events = Array.new(events_params.length)
    events_params.each_with_index do |event_params, index|
      event_relation = where('remote_id = ?', event_params[:event][:remote_id])
        if event_relation.empty?
        venue = nil
        venue_relation = Venue.where('lower(name) = lower(?)', event_params[:venue][:name])
        if venue_relation.empty?
          venue = Venue.create(event_params[:venue])
        else
          venue = venue_relation[0]
        end
        events[index] = venue.events.create(event_params[:event])
      else
        events[index] = event_relation[0]
      end
    end
    events
  end

  def as_json(options = {})
    json = super(options)
    user = User.find(options[:user_id]) if options[:user_id]
    json[:miles_away] = self.venue.distance_from(user, units: :miles) if user
    json
  end
end
