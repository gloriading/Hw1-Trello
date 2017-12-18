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

#1- to check if the entered password is its current password

  def edit_password
    # @user = current_user
  end

  # def update_password
    # @current_password = params[:current_password]
    # @password = params[:password]
    # @password_confirmation = params[:password_confirmation]
  #
  #   if !user.authenticate(params[:current_password])
  #     flash[:alert] = "Please enter your current password."
  #     render :edit_password
  #   else
  #     if params[:password] == params[:password_confirmation]
  #         if current_user.update password: params[:password]
  #           flash[:notice] = "Updated."
  #           redirect_to home_path
  #         else
  #           render :edit_password
  #         end
  #     else
  #       render :edit_password
  #     end
  #   end
  #
  # end
  def update_password
    @user = current_user

    if params[:current_password] == current_userddd.password # not working !!
      bunding.pry
        if @user.update(user_params)
          redirect_to home_path
        else
          render :edit_password
        end
      else
        flash[:alert] = "What is your current password?"
        render :edit_password
    end
  end

  # def create
  #   user = User.find_by(email: session_params[:email])
  #
  #   if user && user.authenticate(session_params[:password])
  #     session[:user_id] = user.id
  #     flash[:notice] = 'Thank you for sign in!'
  #     redirect_to home_path
  #   else
  #     flash.now[:alert] = 'Wrong email or password!'
  #     render :new
  #   end
  # end
  #

  # private
  #   def session_params
  #     params.require(:session).permit(:email, :password)
  #   end
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
