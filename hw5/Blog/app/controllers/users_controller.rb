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
  #
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Updated."
      redirect_to home_path
    else
      render :edit
    end
  end

#------------for change password -------------------------------------------
# The user must enter a correct current password and matching new password and new password confirmation. Make sure that the new password is different from the current password
  #
  def edit_password
    @user = current_user
  end

  def update_password

    # @user = current_user
    @current_password = params[:current_password]
    @new_password = params[:new_password]
    @password_confirmation = params[:password_confirmation]

    if current_user.password == @current_password &&
      @new_password == @password_confirmation
      puts '---------------------------------complete checking'
        if @user.update(password: :password)
          puts '-----------------update completed!'
          redirect_to home_path
        else
          puts '------------------update failed!'
          render :edit_password
        end
    else
      render :edit_password
    end


    # # if params[:current_password] == current_user.password # not working !!
    #   if @user.authenticate(params[:current_password]) && @user.update(user_params)
    #   # if @user.update(user_params)
    #     puts '--------------------------------here!'
    #     puts current_user.password
    #     redirect_to home_path
    #   else
    #     puts '--------------------------------NO?!'
    #     render :edit_password
    #   end

  end
#----------------------------------------------------------------------------
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
