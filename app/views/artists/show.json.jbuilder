json.id @artist.id
json.name @artist.name
json.image_url @artist.image_url
json.thumb_url @artist.thumb_url

json.events @artist.events do |event|
  json.id event.id
  json.title event.title
  json.datetime event.datetime
  json.ticket_status event.ticket_status
  json.ticket_url event.ticket_url
  json.rsvp_url event.rsvp_url

  json.venue do 
    json.name event.venue.name
    json.city event.venue.city
    json.region event.venue.region
    json.country event.venue.country
    json.miles_away event.venue.distance_from(current_user)
  end
end