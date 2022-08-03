# frozen_string_literal: true

# helper methods
def lorem_paragraph
  Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 12)
end

def lorem_description(n = 3)
  n.times.map do
    lorem_paragraph
  end.join("\n\n")
end


# Default User
User.create(username: 'UserName', email: 'user@example.com', password: '123456', description: lorem_description)

# Populate with Users
9.times do
  user = Faker::Internet.user(:username, :safe_email, :password)

  # rename :safe_email key
  mask = { safe_email: :email }
  new_user = user.each.with_object({}) { |(k, v), memo| memo[mask[k] || k] = v }

  new_user[:description] = lorem_description

  User.create(new_user)
end

# Populate with Posts
users = User.all.records
5.times do
  user = users.sample
  text = lorem_description
  user.posts.create(body: text)
end
