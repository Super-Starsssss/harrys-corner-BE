Topic.create!(title: "Java")
Topic.create!(title: "Ruby")
Topic.create!(title: "Python")
TypeQuestion.create!(name: "Selection")
TypeQuestion.create!(name: "Listening")

10.times do |g|
  Collection.create!(name: "Collection #{g + 1}", topic_id: 1)
  Collection.create!(name: "Collection #{g + 1}", topic_id: 2)
  Collection.create!(name: "Collection #{g + 1}", topic_id: 3)
end

50.times do |i|
  Question.create!(name: "Question #{i + 1}", collection_id: rand(1..10))
  3.times do |a|
    Answer.create!(name: "Answer #{a + 1}", check: 0, question_id: i + 1)
  end
  1.times do |a|
    Answer.create!(name: "Answer #{a + 4}", check: 1, question_id: i + 1)
  end
end

30.times do |i|
  User.create(name: "member #{i + 1}", email: "vipcafe#{i + 1}@gmail.com", birthday: "#{Random.rand(1990..2005)}- #{Random.rand(1..12)} - #{Random.rand(1..31)}", password: "xxxxxx", password_confirmation: "xxxxxx", address: "street 1")
end

5.times do |i|
  ClassRoom.create(name: "Class #{i + 1}", delete_class_room: false)
  ClassRoom.create(name: 1, delete_class_room: false)
end
40.times do |i|
  ClassUser.create(user_id: "#{Random.rand(1..30)} ", class_room_id: "#{Random.rand(1..5)}", delete_class_user: false)
end
