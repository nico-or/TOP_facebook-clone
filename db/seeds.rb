# frozen_string_literal: true

# helper methods

# constants
TOTAL_USERS = 10

# Default User
User.create(
  username: "username",
  email: "user@example.com",
  password: "123456",
  description: "default description.",
)

# Populate with Users
(TOTAL_USERS - 1).times do |n|
  User.create(
    username: "user-#{n}",
    email: "user-#{n}@example.com",
    password: "password",
    description: "default description.",
  )
end

# Populate with Posts
users = User.all.records
5.times do
  user = users.sample
  text = "lorem ipsum..."
  user.posts.create(body: text)
end
