class Artist < ApplicationRecord
  has_many :artist_events
  has_many :events, through: :artist_events

  has_many :artist_users
  has_many :users, through: :artist_users

  REQUEST = ArtistRequest
  
  def self.find_or_fetch(name)
    artistRelation = where('lower(name) = lower(?)', name)
    artistRelation.empty? ? fetch(name) : artistRelation[0]
  end

  private

  def self.fetch(name)
    artist_params = REQUEST.new(name).artist
    create(artist_params)
  end
end
