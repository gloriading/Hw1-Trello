class SessionsController < ApplicationController

    def new
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

    def create
      @user = User.find_by_email(session_params[:email])

      if @user && @user.authenticate(session_params[:password])
        #  we want to make this conditional with the checkbox
        if session_params[:remember_me]
          cookies.permanent.signed[:auth_token] = @user.auth_token
        else
          cookies.signed[:auth_token] = @user.auth_token
        end
        redirect_to home_path
        flash[:notice] = 'Thank you for sign in!'
      else
        flash.now[:alert] = 'Invalid email or password!'
        render :new
      end
    end

    def destroy
      # session[:user_id] = nil
      cookies.delete(:auth_token)
      redirect_to home_path, notice: 'Signed Out!'
    end


  private
    def session_params
      params.require(:session).permit(:email, :password, :remember_me)
    end


end
