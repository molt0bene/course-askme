class UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)
    @user = User.create(user_params)

    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Вы успешно зарегистрировались'
  end

  def new
    session[:curr_time] = Time.now
    @user = User.new
  end
end
