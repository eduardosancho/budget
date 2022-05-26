# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

@first_user = User.new(name: 'Arnold', email: 'first@email.com', password: '123456', password_confirmation: '123456')
@first_user.skip_confirmation!
@first_user.save!

@first_category = Category.create(user: @first_user, name: 'Travel')
@first_category.icon.attach(io: File.open('app/assets/images/planet.png'), filename: 'planet.png')

@first_operation = Operation.create(author: @first_user, name: 'Plane Tickets', amount: 5)

@first_categorization = Categorization.create(operation: @first_operation, category: @first_category)