class SearchController < ApplicationController
  def index
    @results = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CO&limit=2&api_key=ADDNfDQoSCfrveqS8FFgjEepyBS3enbsvsd3JAzG&format=JSON")
    JSON.parse(@results.body)
    require 'pry'; binding.pry
  end
end
