class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role, optional: true
  has_many :cars, dependent: :destroy
  has_many :dealerships, dependent: :destroy
  validates :name, presence: true
  before_save :assign_role         

  def assign_role
    self.role = Role.find_by name: "User" if role.nil?
  end
  
  def admin?
    role.name == "Admin"
  end
  
  def user?
    role.name == "User"
  end

end