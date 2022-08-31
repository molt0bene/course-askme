class UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email)
    @user = User.create(user_params)

    redirect_to root_path, notice: 'Вы успешно зарегистрировались'
  end

  def new
    session[:current_time] = Time.now
    @user = User.new
  end
end
