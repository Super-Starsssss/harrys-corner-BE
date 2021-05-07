Topic.create!(title: "Java")
Topic.create!(title: "Ruby")
Topic.create!(title: "Python")
TypeQuestion.create!(name: "Selection")
TypeQuestion.create!(name: "Listening")

# 10.times do |g|
#   Collection.create!(name: "Collection #{g + 1}", topic_id: 1)
#   Collection.create!(name: "Collection #{g + 1}", topic_id: 2)
#   Collection.create!(name: "Collection #{g + 1}", topic_id: 3)
# end

# 50.times do |i|
#   Question.create!(name: "Question #{i + 1}", collection_id: rand(1..10))
#   3.times do |a|
#     Answer.create!(name: "Answer #{a + 1}", check: 0, question_id: i + 1)
#   end
#   1.times do |a|
#     Answer.create!(name: "Answer #{a + 4}", check: 1, question_id: i + 1)
#   end
# end

# 30.times do |i|
#   User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "xxxxxx", password_confirmation: "xxxxxx", address: "viet nam", phone_number: Faker::PhoneNumber.cell_phone_in_e164)
#   Student.create(user_id: (i + 1))
# end

# e = 30
# 5.times do |i|
#   User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "xxxxxx", password_confirmation: "xxxxxx", address: "viet nam", phone_number: Faker::PhoneNumber.cell_phone_in_e164)
#   Teacher.create(user_id: (e + 1))
# end

# 5.times do |i|
#   ClassRoom.create(name: "class rom #{i + 1}", teacher_id: Random.rand(2..6))
# end

28.times do |i|
  StudentClass.create(student_id: Random.rand(1..30), class_room_id: Random.rand(2..6))
end
