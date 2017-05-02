class Address < ApplicationRecord
  belongs_to :company
  belongs_to :country

  # Validations
  validates :street, presence:{message: "the street is nil"}
  validates :current?, presence:{message: "the current is nil"}

  # callback
  before_save :upcase_street, unless: "street.nil?" #Guardar streets en mayusculas


  private
  def upcase_street
    street.upcase!
  end

end
