class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :members
  has_many :tenants, through: :members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :invitable

  def self.find_or_invite_by_email(email, current_user)
    user = find_by(email:)
    return user if user.present?
    # Invite this person email and is invited by this user.
    invite!({ email: email }, current_user)
  end

  def invite_to_tenant?(tenant)
    tenant.members.exists?(user: self)
  end

  def invite_to_tenant(tenant)
    tenant.members.create!(user: self)
  end

  def to_s
    email
  end
end
