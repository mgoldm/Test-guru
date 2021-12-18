# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!([{ name: 'Nick', email: '123@mail.ru' },
                     { name: 'Jenny', email: '12345@mail.ru' }])

category = Category.create!([{ title: 'Ruby on Rails' },
                             { title: "Python" }])

test = Test.create!([{ title: 'Ruby', level: 1, category_id: category[0], author_id: user[0] },
                     { title: 'Python', level: 1, category_id: category[1], author_id: user[1] }])

question = Question.create!([{ title: 'How we can create a model?', test_id: test[0] },
                             { title: 'How we can install a library?', test_id: test[1] }])

Answer.create!([{ title: 'bin/rails g model', correct: true, question_id: question[0] },
                { title: 'pip install ...' }, correct: true, question_id: question[1]])