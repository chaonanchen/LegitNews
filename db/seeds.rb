# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..50
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.free_email(name)

  user = User.new
  user.email = email
  user.name = name
  if user.save
    for j in 1..50
      article = Article.new
      article.title = Faker::Book.title
      article.content = Faker::Lorem.paragraph
      article.user = user
        if article.save
          for ii in 1..10
            comment = Comment.new
            comment.user = user
            comment.article = article
            comment.message = Faker::Lorem.sentence(10)
            comment.save

          end
        end
    end
  end
end
