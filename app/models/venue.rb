class Venue < ApplicationRecord
  has_many :events
  acts_as_mappable
end
