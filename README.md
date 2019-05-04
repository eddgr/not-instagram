# Not Instagram

**Not Instagram** is an app built on Ruby on Rails and is not affiliated with Instagram.

**Not Instagram** allows users to create posts by uploading photos (jpg, jpeg, png, and gif) with captions. These can later be edited or deleted by the user who posted them. Users can comment on other users posts.

Additionally, users can follow or be followed by other users and a new feed will be created on the home page that allows current users to see all the latest posts from users they follow.

Users can edit their own user information or choose to delete their account.

To get started, run `bundle install` and `rails db:migrate`, then start the rails server.

## Models

- User
- Post
- Relationship
- Comment

## Notable Gems

- ruby 2.6.1
- rails 5.2.3
- [bootstrap 4.3.1](https://github.com/twbs/bootstrap-rubygem)
  - Entire app was styled with Bootstrap
- jquery-rails
  - Bootstrap dependency, no actual jQuery was used
- [active_storage_validations](https://github.com/igorkasyanchuk/active_storage_validations)
  - Helps with ActiveStorage validations for photo uploads
- bcrypt 3.1.7
  - Helps encrypt passwords

## To Do List

- Add user avatars
- Add post likes
- Add user to user messaging
