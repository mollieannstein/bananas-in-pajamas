User.delete_all
Article.delete_all
Tagging.delete_all
Revision.delete_all
Category.delete_all

user = User.create!(username: "yaboichrissyb", email: "yaboi@gmail.com", password: 'password', admin_status: true)
user2 = User.create!(username: "boolean", email: "boo@gmail.com", password: 'password', admin_status: true)

general_users = 10.times.map do
  User.create!( username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: 'password',
                admin_status: false
                )
end

categories =  5.times.map do
  Category.create!(name: Faker::Team.sport)
end

non_featured_articles = 20.times do
  Article.create!(creator_id: general_users.sample.id, featured: false , title: Faker::Hipster.word, content: Faker::Hipster.paragraph(25))
end

featured_articles = 5.times do
  Article.create!(creator_id: general_users.sample.id, featured: true , title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(25))
end

taggings = 5.times.map do
  Tagging.create!(article_id: Article.all.sample.id, category_id: categories.sample.id)
end

article = Article.create!(creator_id: 1, featured: true, title: "Bananas", content: Faker::Hipster.paragraph)


tagging = Tagging.create!(article_id: 1, category_id: 1)

revision = Revision.create!(article_id: 1, revisor_id: 2, revised_content: "I revised this BOO")

