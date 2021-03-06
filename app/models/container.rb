class Container < ApplicationRecord
  has_many :bl_containers

  enum kind_of_container: {HIGH_CUBE_40: 1, OPEN_TOP_20: 2, OPEN_TOP_40: 3, STANDAR_20: 4, STANDAR_40: 5, TANK: 6, REEFER_20: 7, REEFER_40: 8 } #para el tipo de container


  # Validations
  validates :code, presence:{message: "the code is nil"}, length: { is: 11, message: "the code is not of 11 caracters" }
  validates :kind_of_container, presence:{message: 'the kind_of_container is nil'}

  #Metodo para ver los errores de validaciones
  def all_errors
    if self.persisted?
      self.reload
    end
    self.valid?
    self.errors.messages
  end


  # Metodo para listar cantidad de equipos por su tipo
  def self.list_for_type
    aux_temp = {}
    aux_temp[:high_cube] = Container.where(kind_of_container: 1).count
    aux_temp[:open_top_20] = Container.where(kind_of_container: 2).count
    aux_temp[:open_top_40] = Container.where(kind_of_container: 3).count
    aux_temp[:standar_20] = Container.where(kind_of_container: 4).count
    aux_temp[:standar_40] = Container.where(kind_of_container: 5).count
    aux_temp[:tank] = Container.where(kind_of_container: 6).count
    aux_temp[:reefer_20] = Container.where(kind_of_container: 7).count
    aux_temp[:reefer_40] = Container.where(kind_of_container: 8).count
    print aux_temp
  end
end
