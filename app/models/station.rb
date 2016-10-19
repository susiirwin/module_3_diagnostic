class Station
  attr_reader :station_name,
              :state,
              :street_address,
              :zip,
              :fuel_type_code,
              :radius,
              :access_days_time

  def initialize(result)
    @station_name = result["station_name"]
    @state = result["state"]
    @street_address = result["street_address"]
    @zip = result["zip"]
    @fuel_type_code = result["fuel_type_code"]
    @radius = result["radius"]
    @access_days_time = result["access_days_time"]
  end
end
