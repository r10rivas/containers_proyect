class Bl < ApplicationRecord
  belongs_to :organization
  belongs_to :consignee, class_name:'Company', foreign_key: 'consignee_id'
  belongs_to :destination, class_name:'Port', foreign_key: 'destination_id'
  belongs_to :origin, class_name:'Port', foreign_key: 'origin_id'
  belongs_to :bl_master, class_name:'Bl', foreign_key: 'bl_master_id', optional: true
  has_many :bl_house, class_name:'Bl', foreign_key: 'bl_master_id'
  belongs_to :travel
  has_many :bl_containers

  #Validations
  validates :cod_bl, presence:{message: 'the cod_bl is nil'}, uniqueness:{message: "the cod_bl is registred"}
  validates :date_arrive, presence:{message: 'the date_arrive is nil'}
  validates :bl_master, presence:{message: 'the bl is house, and the master?'}, if:"is_master == false"
  validate :blm_consignee, if: "is_master == true"

  #Callbacks
  before_save :is_house_default


  def json_blh
    hash = {}
    hash[:cod_bl] = self.cod_bl
    hash[:shipping_company] = self.organization.company.name
    hash[:consignee] = self.consignee.name
    hash[:destination] = self.destination.name
    hash[:origin] = self.origin.name
    hash[:date_arrive] = self.date_arrive
    # hash[:is_master] = self.is_master
    hash[:travel] = self.travel.cod_travel
    hash[:ship] = self.travel.ship.name
    if self.is_master == true
      hash[:is_master] = self.is_master
    else
      hash[:bl_master] = self.bl_master.cod_bl
    end
    # hash[:containers] = BlContainer.find_by(id: self)(person_id: self.id)
    print hash
  end

  private

  #Callback para hacer un bl por default house si es nil
  def is_house_default
    self.is_master = false
  end

  #Validacion customer para que un blm solo pueda tener un consignatario nvocc
  def blm_consignee 
    if self.consignee.nvocc == false
      errors.add :consignee,'is not nvocc'
    end
  end
end
