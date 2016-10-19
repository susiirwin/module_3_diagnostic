class SearchController < ApplicationController
  def index
    @results = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&state=CO&limit=10&api_key=ADDNfDQoSCfrveqS8FFgjEepyBS3enbsvsd3JAzG&format=JSON&radius=6")
    raw_results = JSON.parse(@results.body)
    # turn hash into object here

    # require 'pry'; binding.pry
  end
end
