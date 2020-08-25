# labs-and-things

## Description.

Labs and Things is for storing laboratory appointments.  As a user you can see all your scheduled appointments and all the labs you will be visiting for those appointments.


## What is Labs and Things.
  * Create new users.
  * Sign in saved users.
  * Login/logout.
  * Has database.

## Create a user.
  * User has: email, first name, last name, birthdate.

## Create new appointments.
  * Add a new appointment to user.
  * Appointment has: type, time and date.

## Create associated laboratories with users through appointments.
  * Add a laboratory to the appointment belonging to a user.
  * Laboratory has: name, type, phone number, address, hours, days of operation.

## Installation.
  You can download this repo and try it out locally. Clone the repo and run

      $ bundle install

You can can create a user in the rails console to test

      $ rails console
      $ rails c

Run your local server with 

      $ rails server
      $ rails s


## Gems Used.
  * Ruby '2.6.1'
  * Rails', '~> 6.0.3', '>= 6.0.3.2'
  * Sqlite3', '~> 1.4'
  * Puma', '~> 4.1'
  * Sass-rails', '>= 6'
  * Webpacker', '~> 4.0'
  * Turbolinks', '~> 5'
  * Bcrypt', '~> 3.1.7'
  * Omniauth-google-oauth2", "~> 0.8.0"
  * Omniauth-github'
  * Dotenv-rails', groups: [:development, :test]
  * Byebug, platforms: [:mri, :mingw, :x64_mingw]
  * Activerecord, "~> 6.0"

 ## Future Improvements
  * Add feature where users can edit appointments.
  * Add feature where users can have more functionality.
  * Touch up HTML, CSS.
