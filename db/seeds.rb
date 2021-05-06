Topic.create!(title: "Java")
Topic.create!(title: "Ruby")
Topic.create!(title: "Python")
TypeQuestion.create!(name: "Selection")
TypeQuestion.create!(name: "Listening")


10.times do |g|
	Collection.create!(name: "Collection #{g +1}", topic_id: 1)
	Collection.create!(name: "Collection #{g +1}", topic_id: 2)
	Collection.create!(name: "Collection #{g +1}", topic_id: 3)
end

50.times do |i|
	Question.create!(name: "Question #{i +1}", collection_id: rand(1..10))
	3.times do |a|
		Answer.create!(name: "Answer #{a +1}", check: 0, question_id: i +1 )
	end
	1.times do |a|
		Answer.create!(name: "Answer #{a + 4}", check: 1, question_id: i + 1)
	end
end 

