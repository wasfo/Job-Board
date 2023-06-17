class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_default_role

  def set_default_role
    self.role = "user"
  end

  def admin?
    self.role == "admin"
  end

  ROLES = %w{admin user}
  has_many :job_applications
end
