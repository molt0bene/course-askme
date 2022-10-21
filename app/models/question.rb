class Question < ApplicationRecord
  include ActionView::Helpers::UrlHelper

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  validates :body, presence: true, length: {maximum: 280}

  has_many :hashtags, dependent: :destroy

  def hashtags_included
    body.scan(/#[[:word:]]+/).uniq
  end
end
