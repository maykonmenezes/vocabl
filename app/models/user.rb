class User < ApplicationRecord
  has_many :words
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
