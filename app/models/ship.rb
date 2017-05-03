class Ship < ApplicationRecord
  belongs_to :owner, class_name:'Organization', foreign_key: 'owner_id'
  has_many :travels
  #Validations
  validates :name, presence:{message: "the name is nil"}, uniqueness:{message: "the name is registred"}
end
