# Stepsify Api


## About

This app is a back end of Stepsify mobile app. Is provides services to front end as user authentication using JSON web tokens. User can add target for running in Kilo meters and add entries in kilo meters to achieve the target. User can see progress in Progress bars.

To build this application we used:

 - Ruby on Rails;
 - Active Storage;
 - Postgresql database;
 - Json Web Token (jwt);
 - (bcrypt) to crypt password;
 - Rspec to test the project;
 - Linters ( Rubocop )

## Features

 - Log in, log out and sign up
 - Add running activities target in kilo meters
 - Achieve targets and add them in kilometers

## How to use the application

Application has secure login and signup. A user must provide and password while logging in. On Sign Up User must provide a username, password, sex, height, and weight.

User will get authenticated and add target of running in kilo meters, then user will add steps in kilo meters he has ran, and he can see his progress and stats.

## Getting started

To get a local copy of the repository please run the following commands on your terminal:

  - ```git clone git@github.com:SajjadAhmad14/Stepsify_API.git```
  - ```cd Stepsify_API```
  - ```rails db:create```
  - ```rails db:migrate```
  - ```rails db:seed```

## Launch the application

After making the local copy of the repository:

 - get inside the repository folder;
 - setup the gems of the project: in the terminal run: ```bundle install```
 - enter the command: ```rails s```  to start the server in localhost.
 - then you get the application in the localhost in your web browser.

## Test the application

After making the local copy of the repository:

 - get inside the repository folder;
 - setup the dependencies of the project: in the terminal run: bundle install
 - enter the command: ```bundle exec rspec``` to test the application.
 - then you get the application tested.


Feel free to reach me out. I'm always happy to connect :slightly_smiling_face:

👤 **Sajjad Ahmad**

[<code><img height="26" src="https://cdn.iconscout.com/icon/free/png-256/github-153-675523.png"></code>](https://github.com/SajjadAhmad14)
[<code><img height="26" src="https://upload.wikimedia.org/wikipedia/sco/thumb/9/9f/Twitter_bird_logo_2012.svg/1200px-Twitter_bird_logo_2012.svg.png"></code>](https://twitter.com/Sajjad_Ahmad14)
[<code><img height="26" src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Linkedin.svg/1200px-Linkedin.svg.png"></code>](https://www.linkedin.com/in/sajjadahmad14/)
[<code><img height="26" src="https://cdn4.iconfinder.com/data/icons/free-colorful-icons/360/gmail.png"></code>](mailto:jogimar14@gmail.com)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- <a href="https://www.theodinproject.com/" target="_blank">The Odin Project</a>
- <a href="https://www.stackoverflow.com/" target="_blank">Stackoverflow</a>
- <a href="https://www.microverse.org/" target="_blank">Microverse</a>
