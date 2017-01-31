class ArtistRequest < BandsInTownRequest

  attr_accessor :artist

  def initialize(name)
    @artist = scrub(fetch(name))
  end

  private

  def fetch(name)
    uri = "#{URI_START}#{name}#{URI_END}"
    uri = URI.encode(uri)
    get(uri)
  end

  def scrub(artist_json)
    artist = JSON.parse(artist_json)
    {
      name:      artist['name'],
      image_url: artist['image_url'],
      thumb_url: artist['thumb_url'],
    }
  end
end