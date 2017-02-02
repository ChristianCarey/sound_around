class LocationRequest
  include HTTParty
  BASE_URI = "https://maps.googleapis.com/maps/api/geocode/json?address="
  API_KEY  = ENV["GEO_KEY"]

  attr_accessor :location

  def initialize(location_name)
    @location = scrub(fetch(location_name))
  end
  
  private

  def scrub(json)
    location = JSON.parse(json)
    {
      formatted: location['results'][0]['formatted_address'],
      lat: location['results'][0]['geometry']['location']['lat'],
      lng: location['results'][0]['geometry']['location']['lng'] * -1
    }
  end

  def fetch(location_name)
    uri = "#{BASE_URI}#{location_name}&key=#{API_KEY}"
    uri = URI.encode(uri)
    get(uri)
  end

  def get(uri)
    self.class.get(uri).body
  end
end