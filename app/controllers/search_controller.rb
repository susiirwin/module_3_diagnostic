class SearchController < ApplicationController
  def index
    @response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&state=CO&limit=10&api_key=ADDNfDQoSCfrveqS8FFgjEepyBS3enbsvsd3JAzG&format=JSON&radius=6")
    raw_results = JSON.parse(@response.body)["fuel_stations"]
    @results = raw_results.map do |result|
      Station.new(result)
    end
  end
end
