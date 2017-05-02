class Container < ApplicationRecord
  has_many :bl_containers

  enum kind_of_container: {HIGH_CUBE_40: 1, OPEN_TOP_20: 2, OPEN_TOP_40: 3, STANDAR_20: 4, STANDAR_40: 5, TANK: 6, REEFER_20: 7, REEFER_40: 8 } #para el tipo de container


  # Validations
  validates :code, presence:{message: "the code is nil"}, length: { is: 11, message: "the code is not of 11 caracters" }
  validates :kind_of_container, presence:{message: 'the kind_of_container is nil'}


  def all_errors
    if self.persisted?
      self.reload
    end
    self.valid?
    self.errors.messages
  end



  def self.loquesea(val)

    h = Container.where(kind_of_container: val)#tipo de container
    h.map{|obj| obj.code}
  end

  def self.sisi
    h = Container.all
    m = h.to_a
    array = [] #array para almacenar un array por cada kind_of_container
    hq = []
    st = []
      m.map do |obj|
        if obj.kind_of_container == "HIGH_CUBE_40"
          hq << obj
        elsif obj.kind_of_container == "STANDAR_20"
          st << obj
        end

      end
      array << hq
      array << st
      print array.count
    # m = h.to_a.size
  end


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
