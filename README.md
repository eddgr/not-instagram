# MVP TODO

## PRIORITY
  - Create new post from specific user
  - Login to specific user

## LAYOUT
  - Header nav menu - Sign up, Login, Profile, Logout
    <!-- - Install bootstrap and dependencies -->
    - Sign up
      - form to create new user with validation
      - redirect_to show page
      - set state as logged in
      - Show logged in as user
    - Login
      - form that finds if user exist and goes to show page
      - set state as logged in
      - Show logged in as user
    - Profile
    - Logout
  - Show all following user posts
  - Show all posts
  - Add new content page
  - Show in user profile

## Users
  - has_many Followings, Followers, Posts
  - validates name is unique, is not blank
  <!-- - Show all users -->
  <!-- - create a new user -->
  <!-- - link to users posts -->
  <!-- - edit username -->
  <!-- - Successful new user sign up -->
  - Need following/follower relationship

## Posts
  - belongs_to User, Follower, Following
  - validates title is not blank
  - validates user_id is not blank
  <!-- - Show all posts -->
  <!-- - user << add new post -->
  <!-- - link to posts' user -->
  <!-- - edit post -->
  <!-- - delete post -->

## Relationship
  - belongs_to
  - Following
  - Follower
  - User

  Active
    - following user
  Passive
    - followed by another user

### Stretch Goals
- Post comments
- Post likes

---

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
