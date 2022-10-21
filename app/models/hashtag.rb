class Hashtag < ApplicationRecord
  has_many :questions, through: :question_hashtags
end
