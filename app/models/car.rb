class Car

  def initialize(make, model_year)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = false
  end

  def lights_status
    @lights
  end

  def lights
    if @lights == false
      @lights = true
    elsif @lights == true
      @lights = false
    end
  end

  def make
    @make
  end

  def model_year
    @model_year
  end

  def speed
    @speed
  end

  def accelerate
    @speed = @speed + 10
  end

  def brake

    #as long as the speed is 7km/h or higher, every time the brake method is called, the speed is decremented by 7 units.
    if @speed > 7
      @speed = @speed - 7
    #if the speed equals 7 or anything less, calling the brake method will decelerate the speed of the car to 0km/h
    elsif @speed <= 7
      @speed = 0
    end

  end
  #
  # def parkingbrake
  #
  #
  #
  # end

end
