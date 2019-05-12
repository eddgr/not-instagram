# Not Instagram

**Not Instagram** is an app built on Ruby on Rails and is not affiliated with Instagram.

**Not Instagram** allows users to create posts by uploading photos (jpg, jpeg, png, and gif) with captions. These can later be edited or deleted by the user who posted them.

Additionally, users can:
- Comment, like, and search for other users' posts.
- Follow or be followed by other users. A new feed will be created on the home page that allows current users to see all the latest posts from users they follow.
- Message other users to create a thread between both users.
- Edit their own user information or choose to delete their account.

To get started, run `bundle install` and `rails db:migrate`, then start the rails server.

## Models

- User
- Post
- Relationship
- Comment
- Like
- Message Thread
- Message

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

- Consolidate message inbox to central one
- Add user avatars
