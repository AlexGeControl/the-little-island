class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable
  
  # Field validators:
  validates :username, presence: true, length: {maximum: 32}
  
  # One-to-many relationship:
  has_many :rooms
  has_many :reservations
end
