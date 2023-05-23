# vehicle_analysis.rb

class VehicleAnalysis

  def analyze(vehicle)
    puts "Vehicle has four wheels"
    if vehicle.car?
      puts vehicle.four_wheel_drive? ? "with four wheel drive" : "with two wheel drive"
    elsif vehicle.tractor?
      puts "with big wheels in the back" if vehicle.big_back_wheels?
    elsif vehicle.pickup?
      puts vehicle.four_wheel_drive? ? "with four wheel drive" : "with two wheel drive"
      puts "with big wheels in the back" if vehicle.big_back_wheels?
    end
  end

end
