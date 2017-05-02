class Email < ApplicationRecord
  belongs_to :company
  
  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #Expresion regular para validar formato de correo
  validates :email, presence:{message: "the num_phone is nil" }, uniqueness:{message: "the num_phone is registred"}, format: { :with => VALID_EMAIL_REGEX , message: "the format email is invalid"}
  
  #Rollback
  before_save :upcase_email, unless: "email.nil?" #Guardar correos en mayusculas


  private
  def upcase_email
    email.upcase!
  end
end
