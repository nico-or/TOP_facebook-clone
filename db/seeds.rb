# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'user@example.com', password: '123456')

7.times do
  user = Faker::Internet.user(:safe_email, :password)
  User.create(email: user[:safe_email], password: user[:password])
end

users = User.all.records
5.times do
  user = users.sample
  text = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6)
  user.posts.create(body: text)
end
