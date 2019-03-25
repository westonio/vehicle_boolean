require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/vehicle_analysis'
require 'stringio'
require 'o_stream_catcher'

class VehicleTest <Minitest::Test

  def test_it_exists
    analysis = VehicleAnalysis.new

    assert_instance_of VehicleAnalysis, analysis
  end

  def test_it_knows_that_pickup_has_four_wheels
    vehicle_1 = Vehicle.new("pickup", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("This is a big vehicle")
  end

  def test_it_knows_that_motorcycle_has_two_wheels
    vehicle_1 = Vehicle.new("motorcycle", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("Vehicle has two wheels")
  end

  def test_it_knows_that_car_has_four_wheels
    vehicle_1 = Vehicle.new("car", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("This is a smaller vehicle")
  end

  def test_it_knows_that_tractor_has_four_wheels
    vehicle_1 = Vehicle.new("tractor", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("This is a big vehicle")
  end

  def test_it_knows_that_vehicle_has_four_wheel_drive
    vehicle_1 = Vehicle.new("tractor", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with four wheel drive")
  end

  def test_it_knows_that_vehicle_does_not_have_four_wheel_drive
    vehicle_1 = Vehicle.new("pickup", false, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with four wheel drive")
    assert stdout.include?("with two wheel drive")
  end

  def test_it_knows_that_vehicle_has_big_back_wheels
    vehicle_1 = Vehicle.new("tractor", false, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with big wheels in the back")
  end

  def test_it_knows_that_vehicle_does_not_have_big_back_wheels
    vehicle_1 = Vehicle.new("tractor", false, false)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with big wheels in the back")
  end

end
