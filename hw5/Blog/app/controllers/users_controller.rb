class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id # (this is used in ApplicationController)
      # (not show up yet! go to layout/application.html.erb)
      flash[:notice] = "Thank you for signing up, #{@user.first_name}!"
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
