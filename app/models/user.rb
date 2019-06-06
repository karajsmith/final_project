class User < ApplicationRecord
  # Direct associations

  has_many   :friend_requests,
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :rankings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
