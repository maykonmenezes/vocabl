class User < ApplicationRecord
  has_many :words
  has_many :games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def secret_email
    email.gsub(/.{0,4}@/, '####@')
  end
end
