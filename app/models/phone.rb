class Phone < ApplicationRecord
  belongs_to :company

  # Validations
  validates :num_phone, presence:{message: "the num_phone is nil" }, uniqueness:{message: "the num_phone is registred"}

end
