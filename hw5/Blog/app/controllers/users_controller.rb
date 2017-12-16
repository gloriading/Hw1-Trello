class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :edit_password, :update_password]

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
#----------for edit first_name/last_name/email------------------------------
  def edit
    @user = current_user
    # pass the personal info of current user to the edit form
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to home_path
    else
      render :edit
    end
  end

#------------for change password -------------------------------------------
  def edit_password
    @user = current_user
  end

  def update_password

    @user = current_user
    if @user.new(user_params).current_password != current_user.password
        render :edit_password
        flash[:alert] = "Not Successful! Do it again!!!!"
      else
        flash[:notice] = "Success! "
        redirect_to home_path
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

  # def password_params
  #   params.require()
  # end
end
