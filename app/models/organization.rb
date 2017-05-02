class Organization < ApplicationRecord
  belongs_to :company
  has_many :ships
  # has_many :organizations
  has_many :bls
  belongs_to :company

  # Validations
  # validates :kind_of_organization, presence:{message: 'the kind_of_organization is nil'}
  validates :company, uniqueness:{message: "the company is registred"}


  def self.list_of_bl()
    shipping = Organization.all
    coleccion = []
    shipping.map do |obj|
      coleccion << obj.bls
    end

    coleccion.map { |e|
      if e.length != 0 
        e.map do |obj|
          puts obj.destination.name
        end
      end
    }

    shipping_bls

    # puts shipping
  end



  def json_bl
    Bl.find_by(bl_master: self.id)
  end

end
