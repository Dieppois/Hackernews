class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: :auteur_id
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  attr_accessor :email, :username, :password, :password_confirmation, :remember_me
end
