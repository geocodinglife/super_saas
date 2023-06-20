class UsersController < ApplicationController
  before_action :set_user, only: %i[show resend_invitation]

  def index
    @users = User.includes(:tenants).all
  end

  def resend_invitation
    if @user.invitation_accepted_at.present?
      return redirect_to users_path,
                         alert: "User with eamil: \
                #{@user.email} has already accepted \
                the invitation"
    end

    @user.invite!
    redirect_to users_path, notice: "Invitation resend to #{@user.email} "
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
