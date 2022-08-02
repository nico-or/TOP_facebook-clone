# frozen_string_literal: true

# Default User
User.create(username: 'UserName', email: 'user@example.com', password: '123456')

# Populate with Users
9.times do
  user = Faker::Internet.user(:username, :safe_email, :password)

  # rename :safe_email key
  mask = { safe_email: :email }
  new_user = user.each.with_object({}) { |(k, v), memo| memo[mask[k] || k] = v }

  User.create(new_user)
end

# Populate with Posts
users = User.all.records
5.times do
  user = users.sample
  text = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6)
  user.posts.create(body: text)
end
