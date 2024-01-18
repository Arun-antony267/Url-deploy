# url_shortner

## Description
This is a simple URL shortener application built with Ruby on Rails for the backend and React for the frontend.

## Features

- Shorten long URLs.
- Shorten Multiple URLs at a time.
- Shorten Multiple URLs from upload(file should be of format csv).

### How This Works

The given URL is shortened to 7 digit random number and appended to the domain test.tin.ee. (for example https://test.tin.ee/qwe334f5 ). This short URL is then stored in the database along with the original long URL. 

In the case of shortening multiple URLs at a time the long URLs should be seperated by a comma (","). The short URL corresponding to the original long URL will shown on the dashbord.

In the case of shortening long URLs from a file the file should be of the format .csv. The short URL for each long URLs in the file will be shown in the dashboard along with the corresponding long URL.


### Prerequisites

Make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [Postgresql](https://www.postgresql.org/download/)
- [Node.js](https://nodejs.org/en/download/)
- [Yarn](https://yarnpkg.com/getting-started/install)

### How to set up

Make sure you have the following installed in your system. 

- Ruby -v 3.1.2
- Rails -v 7.0.8
- psql (postgreSQl) --version 16.1
- Nodejs -v 18.13.0
- Yarn -v 1.22.19
- sideKiq -V 7.2.0


After that clone the repository and run following commands

- bundle install
- rails assets:precompile
- rails db:migrate
 
 You need to run the sidekiq in another terminal with same project directory in which your project will be running using the following command

 - bundle exec sidekiq

 
 after these commands you are good to go you can launch the website localy by running 

- rails s 


### To View

You can access the project using the following link 

:- https://url-shortner-s7ah.onrender.com/

