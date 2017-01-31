require 'httparty'
require 'uri'
 
class BandsInTownAgent
  include HTTParty
  URI_START = "http://api.bandsintown.com/artists/"
  URI_END   = ".json?api_version=2.0&app_id=christian_viking_code_school"

  def get(uri)
    self.class.get(uri).body
  end
end
