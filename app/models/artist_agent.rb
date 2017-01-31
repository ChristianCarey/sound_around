class AristAgent < BITAgent

  def fetch(artist_name)
    uri = "#{URI_START}#{artist_name}#{URI_END}"
    uri = URI.encode(uri)
    get(uri)
  end
end