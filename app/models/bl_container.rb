class BlContainer < ApplicationRecord
  belongs_to :bl_master, class_name:'Bl', foreign_key: 'bl_master_id'
  belongs_to :bl_house, class_name:'Bl', foreign_key: 'bl_house_id'
  belongs_to :container
end
