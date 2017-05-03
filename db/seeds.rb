# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


###Countries
Country.create([{:name => "VENEZUELA"}, {:name => "ESPAÑA"}, {:name => "ITALIA"}, {:name => "BRAZIL"}, {:name => "FRANCIA"}, {:name => "ARGENTINA"}, {:name => "PANAMA"}, {:name => "SINGAPUR"}, {:name => "TAILANDIA"}, {:name => "CHILE"}, {:name => "MEXICO"}, {:name => "COLOMBIA"}, {:name => "HOLANDA"}])
puts ""
puts ""
puts "Created #{Country.count} countries"



###Companies
Company.create([{name: "TIENDA DE ANIMALES DON PERRO, C.A." , kind_of_doc: "JURIDICA", num_doc: "000972915", nvocc: false},
{name: "DISTRIBUIDORA EL DUQUE C.A.", kind_of_doc: "JURIDICA", num_doc: "313972088", nvocc: false},
{name: "COLGATE PALMOLIVE, C.A.", kind_of_doc: "JURIDICA", num_doc: "000071250", nvocc: false},
{name: "MENDOZA, JUAN CARLOS", kind_of_doc: 2, num_doc: "119906187", nvocc: false},
{name: "PEPSI, C.A.", kind_of_doc: "JURIDICA", num_doc: "000071250", nvocc: false},
{name: "CLICK CARGO AGENTE DE CARGA, C.A." , kind_of_doc: "JURIDICA", num_doc: "002845988", nvocc: true},
{name: "DHL GLOBAL FORWARDING DE VENEZUELA, C.A." , kind_of_doc: "JURIDICA", num_doc: "000693250", nvocc: true},
{name: "NAHUEL SERVICIOS INTERNACIONALES CARGO, C.A", kind_of_doc: "JURIDICA", num_doc: "297824065", nvocc: true},
{name: "FLETES FREELANCE CARGO, C.A.", kind_of_doc: "JURIDICA", num_doc: "296934142", nvocc: true},
{name: "HAMBURG SUD VENEZUELA C.A" , kind_of_doc: "JURIDICA", num_doc: "003092304", nvocc: false},
{name: "TRANSPORTE MARITIMO MAERSK VENEZUELA, S.A.", kind_of_doc: "JURIDICA", num_doc: "301543149", nvocc: false},
{name: "GLOBAL SHIPPING AGENTES NAVIEROS, C.A." , kind_of_doc: "JURIDICA", num_doc: "312011564", nvocc: false},
{name: "SEALAND VENEZUELA S.A", kind_of_doc: "JURIDICA", num_doc: "01543149", nvocc: false}])
puts ""
puts ""
puts "Created #{Company.count} companies"



###Ports
venezuela = Country.first
Port.create([{name: "MARACAIBO", country: venezuela}, { name:'LA GUAIRA', country: venezuela}, { name: 'PUERTO CABELLO', country: venezuela}])

holanda = Country.find_by name: 'HOLANDA'
Port.create([{name: "AMSTERDAM", country: holanda}])

francia = Country.find_by name: 'FRANCIA'
Port.create([{name: "LE HAVRE", country:francia}, {name: "LES SABLES D'OLONNE", country:francia}, {name: "MARSEILLE", country: francia}])

italy = Country.find_by name: 'ITALIA'
Port.create([{name: "NAPOLI", country:italy}, {name: "PALERMO", country:italy}, {name: "PESCARA", country: italy}])

spain = Country.find_by name: "ESPAÑA"
Port.create([{name: "MALLORCA", country:spain}, {name: "MADRID", country:spain}, {name: "VALENCIA", country: spain}])
puts ""
puts ""
puts "Created #{Port.count} ports"



###Organizations
hamburg = Company.find_by name: "HAMBURG SUD VENEZUELA C.A"
hamburg_shi = Organization.create(company: hamburg)

maer = Company.find_by name: "TRANSPORTE MARITIMO MAERSK VENEZUELA, S.A."
maer_shi = Organization.create(company: maer)

global = Company.find_by name: "GLOBAL SHIPPING AGENTES NAVIEROS, C.A."
global_shi =  Organization.create(company: global)

sealand = Company.find_by name: "SEALAND VENEZUELA S.A"
sealand_shi = Organization.create(company: sealand)
puts ""
puts ""
puts "Created #{Organization.count} organization"
#shi = shipping



###Ships
Ship.create([{owner: global_shi, name: "ASIAN FAVOUR"}, {owner: global_shi, name: "MUFASA"}])

Ship.create([{owner: maer_shi, name: "MARIE SCHULTE"}, {owner: maer_shi, name: "MAERSK SAIPER"}])

Ship.create([{owner: hamburg_shi, name: "RIO HUDSON"}, {owner: hamburg_shi, name: "SAN ADRIANO"}])
puts ""
puts ""
puts "Created #{Ship.count} ships"



###Travels
mufasa = Ship.find_by name: "MUFASA"
p_origen_1 = Port.find_by name: "PESCARA"
p_destination_1 = Port.find_by name:"MARACAIBO"
travel_1 = Travel.create(cod_travel: "1010", ship: mufasa, origin: p_origen_1, destination: p_destination_1)

rio_hudson = Ship.find_by name: "RIO HUDSON"
p_origen_2 = Port.find_by name: "MALLORCA"
p_destination_2 = Port.find_by name:"MARACAIBO"
travel_2 = Travel.create(cod_travel: "2020", ship: rio_hudson, origin: p_origen_2, destination: p_destination_2)

san_adriano = Ship.find_by name: "SAN ADRIANO"
p_origen_3 = Port.find_by name: "PESCARA"
p_destination_3 = Port.find_by name:"LA GUAIRA"
travel_3 = Travel.create(cod_travel: "3030", ship: san_adriano, origin: p_origen_3, destination: p_destination_3)

maersk_saiper = Ship.find_by name: "MAERSK SAIPER"
p_origen_4 = Port.find_by name: "AMSTERDAM"
p_destination_4 = Port.find_by name:"PUERTO CABELLO"
travel_4 =Travel.create(cod_travel: "4040", ship: maersk_saiper, origin: p_origen_4, destination: p_destination_4)
puts ""
puts ""
puts "Created #{Travel.count} travels"



###Bls
#BLM_1
dhl_nvocc = Company.find_by name: "DHL GLOBAL FORWARDING DE VENEZUELA, C.A."
blm_1 = Bl.create(cod_bl: "COSU36425960", organization: hamburg_shi, consignee:dhl_nvocc, origin: p_origen_1, destination: p_destination_1, date_arrive: Time.now, is_master: true, travel: travel_1)

#BLH'S
consignee_blh_1 = Company.find_by name: "COLGATE PALMOLIVE, C.A."
blh_1 = Bl.create(cod_bl: "COSU36827960", organization: hamburg_shi, consignee:consignee_blh_1, origin: p_origen_1, destination: p_destination_1, date_arrive: Time.now, is_master: false, travel: travel_1, bl_master: blm_1)

consignee_blh_2 = Company.find_by name: "TIENDA DE ANIMALES DON PERRO, C.A."
blh_2 = Bl.create(cod_bl: "COSU0100541781", organization: hamburg_shi, consignee:consignee_blh_2, origin: p_origen_1, destination: p_destination_1, date_arrive: Time.now, is_master: false, travel: travel_1, bl_master: blm_1)


###BLM_2
click_nvocc = Company.find_by name: "CLICK CARGO AGENTE DE CARGA, C.A."
blm_2 = Bl.create(cod_bl: "HLCUTPE160824854", organization: maer_shi, consignee:click_nvocc, origin: p_origen_2, destination: p_destination_2, date_arrive: Time.now, is_master: true, travel: travel_2)

#BLH
consignee_blh_1 = Company.find_by name: "COLGATE PALMOLIVE, C.A."
blh_3 = Bl.create(cod_bl: "MSCUUH725253", organization: maer_shi, consignee:consignee_blh_1, origin: p_origen_2, destination: p_destination_2, date_arrive: Time.now, is_master: false, travel: travel_2, bl_master: blm_2)

consignee_blh_2 = Company.find_by name: "PEPSI, C.A."
blh_4 = Bl.create(cod_bl: "SLD315390", organization: maer_shi, consignee: consignee_blh_2, origin: p_origen_2, destination: p_destination_2, date_arrive: Time.now, is_master: false, travel: travel_2, bl_master: blm_2)
puts ""
puts ""
puts "Created #{Bl.count} bls"



###Containers
container_1 = Container.create(code: "CBHU3516034", kind_of_container: "STANDAR_20")

container_2 = Container.create(code: "TRLU0246244", kind_of_container: "TANK")

container_3 = Container.create(code: "TGHU1188712", kind_of_container: "HIGH_CUBE_40")

container_4 = Container.create(code: "GESU4412192", kind_of_container: "STANDAR_20")

container_5 = Container.create(code: "CBHU3247953", kind_of_container: "OPEN_TOP_40")

container_6 = Container.create(code: "TGHU0055757", kind_of_container: "STANDAR_20")

container_7 = Container.create(code: "CBHU3743022", kind_of_container: "HIGH_CUBE_40")

container_8 = Container.create(code: "TCKU1917931", kind_of_container: "HIGH_CUBE_40")
puts ""
puts ""
puts "Created #{Container.count} containers"



###BlContainers
#containers for blh_1
BlContainer.create([{bl_master: blm_1, bl_house:blh_1, container:container_1}, {bl_master: blm_1, bl_house:blh_1, container:container_2}])

#containers for blh_2
BlContainer.create([{bl_master: blm_1, bl_house:blh_2, container:container_3}, {bl_master: blm_1, bl_house:blh_2, container:container_4}])

#containers for blh_3
BlContainer.create([{bl_master: blm_2, bl_house:blh_3, container:container_5}, {bl_master: blm_1, bl_house:blh_3, container:container_6}])

#containers for blh_4
BlContainer.create([{bl_master: blm_2, bl_house:blh_4, container:container_7}, {bl_master: blm_1, bl_house:blh_4, container:container_8}])
puts ""
puts ""
puts "Created #{BlContainer.count} bl_containers"






















# company1 = Company.find_by name: 'HAMBURG SUD VENEZUELA C.A'

# puts company1.name

# puts Email.count

# Email.create(email: "HAMBURGSUDsadagamil.com", company: company1).errors

# puts Email.count



=begin
email1 = Company.find_by name: 'HAMBURG SUD VENEZUELA C.A'

puts Email.count

puts email1.name

# Email.create(email: "HAMBURGSUD.WHEREVjhhghsdR", company: email1)

puts Email.count

puts todo = email1.emails


puts todo.class


puts j = Email.all

puts j[1].email

j.map{|p| p.email}.

=end








 # c = Country.find(3)

 # puts c.name



# c = Country.find_by name: 'VENEZUELA'

# puts c.name