class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 70 }
  validates :role, presence: true

  has_one :order

  ROLES = { admin: 'admin', customer: 'customer' }.freeze

  def is_customer?
    role == User::ROLES[:customer]
  end

  def is_admin?
    role == User::ROLES[:admin]
  end
end
