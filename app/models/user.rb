class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Start *TODO: "Relacionar las tablas en los modelos"
  has_many :reactions
  has_many :comments
  has_many :publications, through: :reactions
  # End *TODO: ""

end
