class EventsRequest < BandsInTownRequest
    
  attr_accessor :events

  def initialize(artist_name)
    @events = scrub(fetch(artist_name))
  end

  private

  def fetch(artist_name)
    uri = "#{URI_START}#{artist_name}/events#{URI_END}"
    uri = URI.encode(uri)
    get(uri)
  end

  def scrub(events_json)
    events = JSON.parse(events_json)
    events.map do |event|
      {
        event: {
          remote_id:     event['id'],
          title:         event['title'],
          datetime:      event['datetime'],
          ticket_status: event['ticket_status'],
          ticket_url:    event['ticket_url'],
          rsvp_url:      event['facebook_rsvp_url']
        },
        venue: {
          name:    event['venue']['name'],
          city:    event['venue']['city'],
          region:  event['venue']['region'],
          country: event['venue']['country'],
          lat:     event['venue']['latitude'],
          # longitude is negative in data
          lng:     event['venue']['longitude'].to_f * -1
        }
      }
    end
  end
end
