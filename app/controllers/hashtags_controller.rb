class HashtagsController < ApplicationController

  # GET /hashtags
  def index
    @hashtags = Hashtag.all
  end

  # GET /hashtags/1 or /hashtags/1.json
  def show
    # @hashtags = Hashtag.where(...)
  end

  # GET /hashtags/new
  def new
    @hashtag = Hashtag.new
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)

    if @hashtag.save
      render question_path(@hashtag.question)
    end
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:value, :question_id)
  end
end
