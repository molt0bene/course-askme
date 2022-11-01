class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id, :author_id)

    @question = Question.create(question_params)
    @question.author = current_user

    if @question.save
      @question.hashtags_included.each do |hashtag|
        @new_hashtag = Hashtag.find_by(value: hashtag.downcase)

        @new_hashtag = Hashtag.create(value: hashtag.downcase) if @new_hashtag.nil?

        @new_hashtag.questions << @question
        @new_hashtag.save!
      end

      @question.reload

      redirect_to user_path(@question.user.nickname), notice: 'Новый вопрос создан!'
    else
      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)

    redirect_to user_path(@question.user.nickname), notice: 'Обновили вопрос!'
  end

  def hide
    @question.update(visible: false)

    redirect_to questions_path
  end

  def destroy
    @user = @question.user

    # если мы удалили все вопросы с этим тегом, то сам тег тоже удаляем
    @question.hashtags.each do |hashtag|
      # список остальных вопросов с этим тегом
      hashtag_questions = hashtag.questions - [@question]

      if hashtag_questions.empty?
        hashtag.destroy!
      end
    end

    @question.destroy
    redirect_to user_path(@user.nickname), notice: 'Вопрос удален!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).last(10)
    @hashtags = Hashtag.last(5)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

end

