class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:password_reset][:email])
    # binding.pry
    @user.send_password_reset if @user
     redirect_to home_path, notice: "Email sent with password reset instructions"
    #  flash[:info] = "Email sent with password reset instructions"
  end
  
  def edit
     @user = User.find_by_password_reset_token!(params[:id])
   end

 def update
   @user = User.find_by_password_reset_token!(params[:id])
   if @user.password_reset_sent_at < 3.days.ago
     redirect_to new_password_reset_path, :alert => "Password reset has expired."
   elsif @user.update_attributes(user_params)
     redirect_to home_path, notice: "Password has been reset!"
   else
     render :edit
   end
 end

end
