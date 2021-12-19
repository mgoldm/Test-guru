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
                             { title: 'How we can install a library?', test_id: test[1] },
                             { title: 'How we can calculate the derivative?', test_id: test[1] },
                             { title: 'How we can open ruby console?', test_id: test[0] }])

Answer.create!([{ title: 'bin/rails g model', correct: true, question_id: question[0] },
                { title: 'g model', correct: false, question_id: question[0] },
                { title: 'db:migrate', correct: false, question_id: question[0] },
                { title: 'g controller', correct: true, question_id: question[0] },

                { title: 'pip install ...', correct: true, question_id: question[1] },
                { title: 'include ', correct: false, question_id: question[1] },
                { title: 'python3 -v', correct: false, question_id: question[1] },
                { title: 'from ... import', correct: false, question_id: question[1] },

                { title: "diff('x+y', x, y)", correct: true, question_id: question[2] },
                { title: 'fopen()', correct: false, question_id: question[2] },
                { title: 'cv2.open', correct: false, question_id: question[2] },
                { title: 'print', correct: false, question_id: question[2] },

                { title: 'bin/rails c', correct: true, question_id: question[3] },
                { title: 'g model ', correct: false, question_id: question[3] },
                { title: 'db:migrate', correct: false, question_id: question[3] },
                { title: 'bin/rails s', correct: false, question_id: question[3] }])

Result.create!([{test_id: test[0], user_id: user[0]},
                {test_id: test[1], user_id: user[1]}])