class EntriesController < ApplicationController
  def index
    @place = Place.find_by("id" => params["id"])
    @entries = Entry.where("place_id" => params["id"])
  end

  def new
    @place = Place.find_by("id" => params["id"])
  end

  def create
    # New Entry
    @entry = Entry.new

    # Enter user data from form to Entry's columns
    @entry["title"] = params["title"]
    @entry["occurred_on"] = params["date"]
    @entry["description"] = params["description"]
    @entry["place_id"] = params["id"]
    @entry.save

    redirect_to "/places/#{params["id"]}"
  end

end