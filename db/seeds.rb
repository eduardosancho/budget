# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@first_user = User.create(name: 'Arnold')

@first_category = Category.create(user: @first_user, name: 'Medical')

@first_operation = Operation.create(author: @first_user, name: 'Cough Syrup')

@first_categorization = Categorization.create(operation: @first_operation, category: @first_category)