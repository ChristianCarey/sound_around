class ArtistsController < ApplicationController

  def index
    @artists = current_user.artists

    respond_to do |format|
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.json { render json: @artist }
    end
  end

  def create 
    @artist = Artist.find_or_fetch(params[:artist][:name])
    current_user.artists << @artist

    respond_to do |format|
      format.json { render json: @artist }
    end
  end

  def new 
  end
end
