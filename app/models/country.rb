class Country < ApplicationRecord
  has_many :addresses
  has_many :ports

  # Validations
  validates :name, presence:{message: "the name is nil"}
end
