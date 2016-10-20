require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  # Given that I am on the car simulator landing page, then I see Welcome to the Car Simulator

  context 'Going to a/the landing page' do

    Steps 'Being welcomed' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome")
      end # end of then

    end # end of steps (Being welcomed)

    # Given that I am on the landing page, then I can create a car based on make and model year of the car to be simulated.

    Steps 'Filling out a form to simulate a car' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

    end # end of steps (Filling out a form to simulate a car)

  end

  context 'Going to a status page' do

  # Given that I have entered the make and model year, when I click on a button labelled Simulate Car, then I am taken to a status page showing make, model year and initial speed of the car.

    Steps 'Clicking on the Simulate Car button, I am taken to a status page' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

      Then 'I can click on the submit button' do
        click_button 'Simulate Car' #(clicking this button redirects us to '/cars/status')
      end# end of then(I can click on the submit button)

      And 'I am shown the make, model year and initial speed of the car' do
        expect(page).to have_content('Ford')
        expect(page).to have_content('1993')
        expect(page).to have_content('0 Km/h')
      end

    end # end of Steps (Clicking on the Simulate Car button, I am taken to a status page)

  end # end of context

  context 'Manipulating the speed of the car' do

    #Given that I have created a car, when I click an accelerate button, then I make it speed up in 10Km/h increments.
    Steps 'Clicking on the accelerate button, I can speed up my car' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

      Then 'I can click on the submit button' do
        click_button 'Simulate Car' #(clicking this button redirects us to '/cars/status')
      end# end of then(I can click on the submit button)

      And 'I am shown the make, model year and initial speed of the car' do
        expect(page).to have_content('Ford')
        expect(page).to have_content('1993')
        expect(page).to have_content('0 Km/h')
      end

      Then 'I can click on the accelerate button' do
        click_button 'Accelerate'
      end

      And 'I am shown the updated speed of the car' do
        expect(page).to have_content('Your new speed is 10 Km/h')
      end

    end # end of steps (Clicking on the accelerate button, I can speed up my car)

    #Given that I have created a car, when I click the brake button, then the car slows down by 7Km/h.
    Steps 'Clicking on the brake button I can slow down my car' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

      Then 'I can click on the submit button' do
        click_button 'Simulate Car' #(clicking this button redirects us to '/cars/status')
      end# end of then(I can click on the submit button)

      And 'I am shown the make, model year and initial speed of the car' do
        expect(page).to have_content('Ford')
        expect(page).to have_content('1993')
        expect(page).to have_content('0 Km/h')
      end
      Then 'I can click on the accelerate button' do
        click_button 'Accelerate'
      end

      And 'I am shown the updated speed of the car' do
        expect(page).to have_content('Your new speed is 10 Km/h')
      end

      Then 'I can click on the brake button' do
        click_button 'Brake'
      end

      And 'I am shown the updated speed of the car' do
        expect(page).to have_content('Your new speed is 3 Km/h')
      end

      #Given that I have created a car, and accelerated it, when I repreatedly click the brake, then the car eventually slows down to 0Km/h and does not go backwards.
      And 'if I brake again, my new speed is 0 and does not further decrease' do
        click_button 'Brake'
        expect(page).to have_content('Your new speed is 0 Km/h')
        expect(page).to have_button('Brake', disabled: true)
      end

    end # end of steps (Clicking on the brake button I can slow down my car)

  end #end of context Manipulating speed of the car

  context 'Manipulating lights of the car' do

    Steps 'Clicking on the lights button I can toggle between on and off' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

      Then 'I can click on the submit button' do
        click_button 'Simulate Car' #(clicking this button redirects us to '/cars/status')
      end# end of then(I can click on the submit button)

      And 'I am shown the make, model year and initial speed of the car' do
        expect(page).to have_content('Ford')
        expect(page).to have_content('1993')
        expect(page).to have_content('0 Km/h')
      end

      # Given that I have entered the make and model year, when clicking on a button labelled Simulate Car, then I am taken to a status page that shows whether the lights on the car are on or off. They start off.

      Given 'lights are off by default' do
        expect(page).to have_content('Your headlights are currently off.')
      end

      Then 'I can click on the lights button' do
        click_button 'lights'
      end

      And 'I am shown that the car lights are on' do
        expect(page).to have_content('Your headlights are currently off')
      end

      Then 'I can click on the lights button' do
        click_button 'lights'
      end

      And 'I am shown that the car lights are off' do
        expect(page).to have_content('Your headlights are currently off')
      end

    end # end steps (Clicking on the lights button I can toggle between on and off)

  end #end of context (Manipulating lights of the car)

  context 'Manipulating handbrake of the car' do

    Steps 'Setting and releasing handbrake' do

      Given 'I am on the landing page' do
        visit '/'
      end # end of given

      Then 'I can enter values for make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '1993'
      end # end of then (I can enter values for make and model year)

      Then 'I can click on the submit button' do
        click_button 'Simulate Car' #(clicking this button redirects us to '/cars/status')
      end# end of then(I can click on the submit button)

      And 'I am shown the make, model year and initial speed of the car' do
        expect(page).to have_content('Ford')
        expect(page).to have_content('1993')
        expect(page).to have_content('0 Km/h')
      end
      Then 'I can click on the accelerate button' do
        click_button 'Accelerate'
      end

      And 'I am shown the updated speed of the car' do
        expect(page).to have_content('Your new speed is 10 Km/h')
      end

      Then 'I can click on the brake button' do
        click_button 'Brake'
      end

      And 'I am shown the updated speed of the car' do
        expect(page).to have_content('Your new speed is 3 Km/h')
      end

      #Given that I have created a car, and accelerated it, when I repreatedly click the brake, then the car eventually slows down to 0Km/h and does not go backwards.
      And 'if I brake again, my new speed is 0 and does not further decrease' do
        click_button 'Brake'
        expect(page).to have_content('Your new speed is 0 Km/h')
        expect(page).to have_button('Brake', disabled: true)
      end

      Given 'I can select the Set Hand Brake or Release Hand Brake radio buttons' do
        choose('set_brake')
        choose('release_brake')
      end

    end # end of steps (Setting and releasing handbrake)

  end # end of context(Manipulating handbrake of the car)

end # end of feature
