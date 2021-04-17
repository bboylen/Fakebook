# Fakebook

Facebook clone using Ruby on Rails.

Final project of the Rails curriculum from [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

[Please try it out here](https://lit-woodland-51918.herokuapp.com) (deployed on Heroku)

## Features

- [Devise](https://github.com/heartcombo/devise) used to handle user registration, authentication, session management, recovery and omniauth
  - User receives welcome email on registration
- Users can create, like, and comment on Posts
  - Can only see posts belonging to self or friends
- Users can send and accept friend requests
- Uses PostgreSQL database
- [OAuth](https://github.com/simi/omniauth-facebook) to allow sign-in through user's real Facebook account
- Uses [AWS S3](https://aws.amazon.com/s3/) to store profile photos
- Deployed on [Heroku](https://dashboard.heroku.com/)

## Image

![Screenshot from 2021-04-17 16-19-50](https://user-images.githubusercontent.com/52515015/115127137-c2af1980-9f99-11eb-9e2e-2cd152865b1e.png)
## To-do

- Allow posts to contain an image
- Have Omniauth pull the User's Facebook profile photo
- More functionality for deleting/editing user/comment/post information

## In Summary 

### April 2021
Now that I have learned the front end section of the stack, I came back to this app to style it / clean it up. The app was not at all optimized for mobile, so I had to add in a lot of responsive design breakpoints. It won't win any design awards but I think it looks alright :)

It was definitely a change of place going from working on Javascript / React generated HTML back to server side rendered views. Especially considering that by using the Devise gem for User login, I do not really have full control over the overall architecture/design. 

I think I prefer front end generated HTML. The raw customization available with React Components / Hooks is on another level compared to Rails. Although I have not yet tried Rails [Hotwire](https://hotwire.dev/), which aims to fix this functionality gap.

### September 2020
This was certainly the most involved project I have tackled and I am happy with how it came out - it isn't pretty but the functionality is solid. It was definitely a challenge to get all the model/controller/views logic implemented in a clear and efficient manner. I certainly am coming to recognize the importance of getting a solid foundation on SQL as well as Active Record. Finding an efficient way to call information I needed from the database was often a challenging task.

I also learned a fair bit about getting outside services to work with Rails. In truth it took me quite a bit longer than I expected to get Amazon S3 storage and Facebook OAuth working. Often times many of the writeups on Medium or Stack Overflow contained outdated methods, forcing me to implement solutions cobbled together from multiple sources. While this was a bit of a hassle, it helped me learn some of the great Rails functionality that has been added in recent years, such as using ```config/credentials.yml.enc``` to store credentials. 

While I want to eventually clean up this app some more, I think it is a better use of my time to move on and dive deeper into the front end side of things!




