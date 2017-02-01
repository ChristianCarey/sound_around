class Artist < ApplicationRecord
  has_many :artist_events, dependent: :destroy
  has_many :events, through: :artist_events

  has_many :artist_users, dependent: :destroy
  has_many :users, through: :artist_users

  REQUEST = ArtistRequest
  
  def self.find_or_fetch(name)
    artist_relation = where('lower(name) = lower(?)', name)
    artist_relation.empty? ? fetch(name) : artist_relation[0]
  end

  def find_or_fetch_events
    events_current? ? events : fetch_events
  end

  def update_events
    fetch_events if events_outdated?
  end

  private

  def self.fetch(name)
    artist_params = REQUEST.new(name).artist
    create(artist_params)
  end

  def events_current?
    events_updated_at && events_updated_at >= Date.today
  end

  def events_outdated?
    !events_current?
  end

  def fetch_events
    new_events = Event.fetch(name)
    new_events.each do |new_event|
      events << new_event unless events.include?(new_event)
    end
    self.events_updated_at = Date.today
    self.save!
    events
  end
end
