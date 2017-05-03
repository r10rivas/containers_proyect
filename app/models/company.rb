class Company < ApplicationRecord
  has_many :addresses
  has_many :phones
  has_many :emails
  has_many :bls
  has_one :organization
  
  enum kind_of_doc: {JURIDICA: 1, NATURAL: 2, EXTRANJERA: 3, OTRO: 4} #para el tipo de compañia

  #Validates
  validates :name, presence:{message: "the name is nil"}, uniqueness:{message: "the name is registred"}
  validates :num_doc, presence:{message: "the num_doc is nil"}
  validates :kind_of_doc, presence:{message: "the num_doc is nil"}
  # validates :nvocc, presence:{message: "the nvocc is nil"}

  #Callbacks
  before_save :is_not_nvocc_default, if:"nvocc.nil?"


  def is_not_nvocc_default
    self.nvocc = false
  end
end
