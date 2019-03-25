# vehicle_analysis.rb
class VehicleAnalysis

  def analyze(vehicle)
    if vehicle.car?
      if vehicle.four_wheel_drive? || !vehicle.four_wheel_drive?
        puts "This is a smaller vehicle"
        if vehicle.four_wheel_drive?
          puts "with four wheel drive"
        else
          puts "with two wheel drive"
        end
      end
    elsif vehicle.tractor?
      puts "This is a big vehicle"
      if vehicle.four_wheel_drive?
        puts "with four wheel drive"
      else
        puts "with two wheel drive"
      end
      if vehicle.big_back_wheels?
        puts "with big wheels in the back"
      end
    elsif vehicle.pickup?
      puts "This is a big vehicle"
      if vehicle.four_wheel_drive?
        puts "with four wheel drive"
      else
        puts "with two wheel drive"
      end
      if vehicle.big_back_wheels?
        puts "with big wheels in the back"
      end
    end
  end

end
