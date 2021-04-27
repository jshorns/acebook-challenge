# AceBook

Deployed to heroku and can be viewed [here](https://lizardbook2021.herokuapp.com/).

A facebook clone (well, if you ignore the space lizard theme) built in Rails as a group project, according to specifications given by a Makers Coach acting as client. Features include signing up, signing in, making posts, editing posts (within a certain timeframe of posting), deleting posts, commenting on posts, editing and deleting comments, and liking/unliking other users posts.

We also set up CI and CD using heroku and Circle CI.

This project was built following Agile work processes, using sprints and a Trello board to keep track of specs and user stories.

## Screenshots

![Screenshot 4.](/screenshots/4.png "Screenshot.")

![Screenshot 1.](/screenshots/1.png "Screenshot.")

![Screenshot 3.](/screenshots/3.png "Screenshot.")


![Screenshot 2.](/screenshots/2.png "Screenshot.")


## Installation

First, clone this repository. Then:

```zhrc
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

***TESTING***

Testing was done in rspec; coverage is over 99%.

For a more in-depth view of the coverage report run

`open coverage/index.html`
