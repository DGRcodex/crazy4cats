class Reaction < ApplicationRecord
  # Start *TODO: "optional: true, la migración no tengan null: false"
  belongs_to :publication, optional: true
  belongs_to :user
  belongs_to :comment, optional: true
end
