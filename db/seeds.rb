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
{name: "COLGATE PALMOLIVE, C.A.", kind_of_doc: "JURIDICA", num_doc: "000071250", nvocc: false},
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
hamburd = Company.find_by name: "HAMBURG SUD VENEZUELA C.A"
Organization.create(company: hamburd)

maer = Company.find_by name: "TRANSPORTE MARITIMO MAERSK VENEZUELA, S.A."
Organization.create(company: maer)

global = Company.find_by name: "GLOBAL SHIPPING AGENTES NAVIEROS, C.A."
Organization.create(company: global)

sealand = Company.find_by name: "SEALAND VENEZUELA S.A"
Organization.create(company: sealand)
puts ""
puts ""
puts "Created #{Organization.count} organization"








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