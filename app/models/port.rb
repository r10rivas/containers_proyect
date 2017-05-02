class Port < ApplicationRecord
  belongs_to :country
  has_many :travels
  has_many :bls

  # Validations
  validates :name, presence:{message: "the name is nil"}, uniqueness:{message: "the port is registred"}
end
