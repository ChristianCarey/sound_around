# Sound Around

[SoundAround](https://sound-around.herokuapp.com) is a location-based web application for keeping track of your favorite artists.

## Technology

This app is built with Ruby on Rails and Angular 1.6. 

Data is pulled from the [BandsInTown API](http://www.bandsintown.com/api/overview), and saved in a PostgreSQL database. 

User locations are determined using [Google's geocoding API](https://developers.google.com/maps/documentation/geolocation/intro), and distance from events is calculated with the Geokit gem.

Styling is mostly custom, using a minimal amount of bootstrap's grid system.

## Live version

Visit [sound-around.herokuapp.com](https://sound-around.herokuapp.com) to see a fully functional live version. This is hosted on a free Heroku dyno, so please allow several seconds for inital page load.

Create an acccount, or sign into the example account with the following credentials: 

Email: user@example.com

Password: password

## Usage

To use SoundAround, first log in or create an account. Then you will be able to search for an artist, and see any shows they have coming up. Once an artist's page is displaying, you can search through events by location, sort by nearest or soonest events, and hide events that are sold out.

If an event is not sold out, you can follow a link below its description to buy tickets.

## Installation

To run SoundAround locally, fork and clone this repo, and run "bundle install" in your command line.

Next, migrate the database by running "rake db:migrate".

Next, run "bundle exec figaro install" to create an application.yml file.

In the application.yml file, you will need to add an environment variable named GEO_KEY. Vist [developers.google.com](https://developers.google.com/maps/documentation/geolocation/intro) to get this key, then add it to your application.yml like so:

GEO_KEY: "YourAPIKeyInQuotesHere"

Finally, run "rails s". You are good to go!

