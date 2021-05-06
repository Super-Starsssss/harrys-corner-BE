class Question < ApplicationRecord
  belongs_to :collection
  has_many :answers
end
