class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :members
  has_many :tenants, through: :members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :invitable

  def to_s
    email
  end
end
