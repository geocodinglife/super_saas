class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.all
  end

  def invite
    current_tenant = Tenant.first
    email = params[:email]
    user_from_email = User.where(email: email).first

    if user_from_email.present?

      if Member.where(user: user_from_email, tenant: current_tenant).any?
        redirect_to members_path, alert: "The organization email: #{current_tenant.name}, already has a user with the email: #{email}"
      else
        Member.create!(user: user_from_email, tenant: current_tenant)

        redirect_to members_path, notice: "#{email} whas invited to join the organization #{current_tenant.name}"
      end
    elsif user_from_email.nil? # invite new user who a tenant
      new_user = User.invite!(email: email)
      Member.create!(user: new_user, tenant: current_tenant)
      redirect_to members_path, notice: "#{email} was invited to join the tenant: #{current_tenant}"
    end
  end

  def show; end

  def new
    @member = Member.new
  end

  def edit; end

  def create
    @member = Member.new(member_params)

    return render :new, status: :unprocessable_entity unless @member.save!

    @member = Member.create!(tenant: @tenant, user: current_user)
    redirect_to member_url(@member), notice: 'Member was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @member.update(member_params)

    redirect_to member_url(@member), notice: 'Member was successfully updated.'
  end

  def destroy
    @member.destroy

    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:user_id, :tenant_id)
  end
end
