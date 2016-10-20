class CarsController < ApplicationController

  def index
  end

  #this method creates a new instance of the Car class (app-> models -> car.rb) and assigns it a make and model year, grabbed from the form/input in index.html.erb
  def create
    @car = Car.new(params[:make], params[:model_year])
    #converting the Car.new object into a YAML which stands for Yet Another Markup Language. Storing this car's information in a session. (When not using a database)
    session[:car] = @car.to_yaml
    #once the car object is created, redirect user to status.html.erb (view)
    redirect_to "/cars/status"
  end

  def status
    #When the url route is set to /cars/status, this method loads the car object informatio(which is saved in the session as a YAML) onto status.html.erb
    @car = YAML.load(session[:car])
  end

  def accelerate
    #loads the saved car object and its information, saves it in the instance variable @car
    @car = YAML.load(session[:car])
    # calling the .accelerate feature/method belonging to the Car class on THIS car instance
    @car.accelerate
    #resaving the car instance with all its new info/features into a session, in the YAML language
    session[:car]= @car.to_yaml
    #redirects the user to the status.html.erb page
    render '/cars/status'
  end

  def brake
    #loads the saved car object and its information, saves it in the instance variable @car
    @car = YAML.load(session[:car])
    # calling the .brake feature/method belonging to the Car class on THIS car instance
    @car.brake
    #resaving the car instance with all its new info/features into a session, in the YAML language
    session[:car]= @car.to_yaml
    #redirects the user to the status.html.erb page
    render '/cars/status'
  end

  def lights
    @car = YAML.load(session[:car])
    @car.lights
    session[:car]= @car.to_yaml
    render '/cars/status'
  end

end
