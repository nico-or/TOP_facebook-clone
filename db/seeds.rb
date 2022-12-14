# frozen_string_literal: true

# helper methods
def random_integer(n)
  (n * rand).to_int
end

# constants
TOTAL_USERS = 10
POSTS_PER_USER = 10
FRIENDS_PER_USER = 5
COMMENTS_PER_USER = 10

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
User.find_each do |user|
  random_integer(POSTS_PER_USER).times do
    user.posts.create(
      body: "lorem ipsum...",
    )
  end
end

# Populate with Friendships
User.find_each do |sender|
  User.all.sample(random_integer(FRIENDS_PER_USER)).each do |receiver|
    req = FriendRequest.find_or_create_by(sender: sender, receiver: receiver)
    if req.valid?
      req.save
      req.accepted!
    end
  end
end

# Populate with Comments
User.find_each do |user|
  all_friend_posts = user.friends.flat_map(&:posts)

  # sample with replacement
  friend_posts_to_comment = random_integer(COMMENTS_PER_USER).times.map do
    all_friend_posts.sample
  end

  friend_posts_to_comment.each do |friend_post|
    friend_post.comments.create(
      user: user,
      body: "lorem ipsum...",
    )
  end
end
