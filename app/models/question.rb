class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  validates :body, presence: true, length: {maximum: 280}

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  def hashtags_included
    body.scan(/#[[:word:]]+/).uniq
  end
end
