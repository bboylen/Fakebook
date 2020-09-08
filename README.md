# Fakebook

Facebook clone using Ruby on Rails.

Final project of the Rails curriculum from [The Odin Project] (https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

Please try it out [here] (https://lit-woodland-51918.herokuapp.com) (deployed on Heroku)
## Features

- [Devise](https://github.com/heartcombo/devise) used to handle user registration, authentication, session management, recovery and omniauth
  - User receives welcome email on registration
- Users can create, like, and comment on Posts
  - Can only see posts belonging to self or friends
- Users can send and accept friend requests
- Uses PostgreSQL database
- [OAuth](https://github.com/simi/omniauth-facebook) to allow sign-in through user's real Facebook account
- Deployed on [Heroku](https://dashboard.heroku.com/)

## To-do

- Style with HTML/CSS and add JS (At the time of making this app, I have not learned much front-end development)
- Fix Omniauth (FB access not working in production)
- Allow posts to contain an image
- Have Omniauth pull the User's Facebook profile photo
- More functionality for deleting/editing user/comment/post information




