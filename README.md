# BloggedApp
New version of my first blogging app built on Rails

# Demo
Link: https://blogged-app-nik.herokuapp.com/

 ## Table of Contents
* [Running the app](#how-to-run)
* [About app](#about-app)
* [What I have learnt](#what-i-have-learnt)
* [Inspiration](#inspiration)

## Install
### Requirements
-**Rails 6**
-**PostgreSQL**

### How to run

Download the repo with git:
```
git clone https://github.com/bonikku/BloggedApp
```
The run yarn to install dependencies
```
yarn install
```
Next you need to create database and migrate migrations
```
rails db:create:migrate
```
Finally you can launch the app
```
rails s
```

### About app
New version of my first ever made app on Rails with few additional features and better code.

### What I have learnt
Basics of rails, how sessions works, MVC architecture, many to many associations, unit tests, extra gems like will_paginate and ofc CRUD operations.

### Inspiration
The project was inspired by "The Complete Ruby on Rails Developer Course" available on udemy.
