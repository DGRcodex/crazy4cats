class Comment < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  # Start *TODO: "Relacionar las tablas en los modelos"
  has_many :reactions, dependent: :destroy
  # End *TODO: ""
end
