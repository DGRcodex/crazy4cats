class Publication < ApplicationRecord
    # Start *TODO: "Relacionar las tablas en los modelos"
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions

    # Me gusta o no me gusta
    Kinds = %w[like dislike].freeze
    KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze

    # End *TODO: ""
end
