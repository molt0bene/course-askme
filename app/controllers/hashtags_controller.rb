class HashtagsController < ApplicationController

  # GET /hashtags/1 or /hashtags/1.json
  def show
    @hashtag = Hashtag.where(value: params[:value].downcase)[0]
    @questions = @hashtag.questions.order(created_at: :desc)
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

  def destroy
    if current_user == @hashtag.question.user
      @hashtag.destroy!
    end
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:value, :question_id)
  end
end
