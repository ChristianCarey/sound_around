class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :artist_users, dependent: :destroy
  has_many :artists, through: :artist_users
  acts_as_mappable

  LOCATION_REQUEST = LocationRequest

  def location_string
    location
  end

  def location_string=(location_string)
    location_params = LOCATION_REQUEST.new(location_string).location
    self.location = location_params[:formatted]
    self.lat = location_params[:lat]
    self.lng = location_params[:lng]
  end
end
