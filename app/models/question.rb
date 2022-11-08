class Question < ApplicationRecord
  after_commit :add_hashtags, on: [:create, :update]

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  validates :body, presence: true, length: {maximum: 280}

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  def hashtags_included
    "#{body} #{answer}".downcase.scan(Hashtag::HASHTAG_PATTERN).uniq
  end

  private

  def add_hashtags
    # если после обновления теги изменились, меняем то, что было раньше
    self.hashtags.each { |hashtag| hashtag.questions.delete(self) unless hashtags_included.include?(hashtag) }

    self.hashtags =
      hashtags_included.map { |hashtag| Hashtag.find_or_create_by(value: hashtag) }
  end
end
