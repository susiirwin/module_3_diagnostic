class Station
  attr_reader :station_name,
              :state,
              :street_address,
              :zip,
              :fuel_type_code,
              :radius

  def initialize(result)
    @station_name = result["station_name"]
    @state = result["state"]
    @street_address = result["street_address"]
    @zip = result["zip"]
    @fuel_type_code = result["fuel_type_code"]
    @radius = result["radius"]
  end
end
