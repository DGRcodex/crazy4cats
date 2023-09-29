# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Start *TODO: "Agregamos datos de prueba para las publicaciones"
until Publication.count == 20 do
    Publication.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false))
end

i = 0
until User.count == 20 do
    User.create(email: "test#{i}@gmail", password: "123456","password_confirmation": "123456", photo: Faker::Avatar.image, name: Faker::Name.name)
    i += 1
end

publications = Publication.all
users = User.all

until Comment.count == 40 do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false), publication_id: publications.sample.id, user_id: users.sample.id)
end

r_type = %w[publication comment]
comments = Comment.all
kinds = Publication::Kinds

until Reaction.count == 40 do
    rel_type = r_type.sample
    if rel_type == "publication"
      Reaction.create(publication_id: publications.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    else
      Reaction.create(comment_id: comments.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    end
end

# End *TODO: ""