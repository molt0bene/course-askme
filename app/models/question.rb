class Question < ApplicationRecord
  HASHTAG_PATTERN = /#[[:word:]]+/

  after_commit :add_hashtags, on: [:create, :update]

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  validates :body, presence: true, length: {maximum: 280}

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  def hashtags_included
    "#{body} #{answer}".downcase.scan(HASHTAG_PATTERN).uniq
  end

  private

  def add_hashtags
    # если после обновления теги изменились, меняем то, что было раньше
    old_hashtags = self.hashtags
    old_hashtags.each { |hashtag| hashtag.questions.delete(self) unless hashtags_included.include?(hashtag) }

    hashtags_included.each do |hashtag|
      new_hashtag = Hashtag.find_or_create_by(value: hashtag.downcase)

      new_hashtag.questions << self unless new_hashtag.questions.include?(self)
      new_hashtag.save!
    end
  end
end
