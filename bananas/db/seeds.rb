user = User.create!(username: "yaboichrissyb", email: "yaboi@gmail.com", password: 'password', admin_status: true)
user2 = User.create!(username: "boolean", email: "boo@gmail.com", password: 'password', admin_status: false)

article = Article.create!(creator_id: 1, featured: true, title: "Bananas", content: Faker::Hipster.paragraph)

category = Category.create!(name: "Tropical Fruits")

tagging = Tagging.create!(article_id: 1, category_id: 1)

revision = Revision.create!(article_id: 1, revisor_id: 2, revised_content: "I revised this BOO")