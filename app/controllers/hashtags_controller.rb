class HashtagsController < ApplicationController
  # GET /hashtags/1 or /hashtags/1.json
  def show
    @hashtag = Hashtag.find_by!(value: params[:value].downcase)
    @questions = @hashtag.questions.order(created_at: :desc)
  end
end
