class Travel < ApplicationRecord
  belongs_to :ship
  belongs_to :destination, class_name:'Port', foreign_key: 'destination_id'
  belongs_to :origin, class_name:'Port', foreign_key: 'origin_id'
  has_many :bls
end
