require 'httparty'
require 'uri'
 
class BandsInTownRequest
  include HTTParty
  URI_START = "http://api.bandsintown.com/artists/"
  URI_END   = ".json?api_version=2.0&app_id=sound_around"
  
  private

  def get(uri)
    self.class.get(uri).body
  end
end
