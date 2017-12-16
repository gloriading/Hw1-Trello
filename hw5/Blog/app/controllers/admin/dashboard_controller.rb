class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.order(created_at: :desc)
  end

  private

  def authorize_admin!
    redirect_to home_path, alert: 'Access Denied!' unless current_user.is_admin?
  end 

end
