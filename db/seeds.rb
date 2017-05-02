# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
Country.create([{:name => "ESPAÑA"}, {:name => "ITALIA"}, {:name => "BRAZIL"}], {:name => "VENEZUELA"})
puts ""
puts ""
p "Created #{Country.count} countries"



Company.create([{name: "TIENDA DE ANIMALES DON PERRO, C.A." , kind_of_doc: "JURIDICA", num_doc: "000972915"},
{name: "ROBERTO RIVAS" , kind_of_doc: 2, num_doc: "195821069"},
{name: "HAMBURG SUD VENEZUELA C.A" , kind_of_doc: "JURIDICA", num_doc: "003092304"},
{name: "GLOBAL SHIPPING AGENTES NAVIEROS, C.A." , kind_of_doc: "JURIDICA", num_doc: "312011564"},
{name: "CLICK CARGO AGENTE DE CARGA, C.A." , kind_of_doc: "JURIDICA", num_doc: "002845988"},
{name: "DHL GLOBAL FORWARDING DE VENEZUELA, C.A." , kind_of_doc: "JURIDICA", num_doc: "000693250"},
{name: "COLGATE PALMOLIVE, C.A.", kind_of_doc: "JURIDICA", num_doc: "000071250"},
{name: "SEALAND VENEZUELA S.A", kind_of_doc: "JURIDICA", num_doc: "01543149"},
{name: "TRANSPORTE MARITIMO MAERSK VENEZUELA, S.A.", kind_of_doc: "JURIDICA", num_doc: "301543149"}])
=end

puts ""
puts ""
puts "Created #{Company.count} companies"


company1 = Company.find_by name: 'HAMBURG SUD VENEZUELA C.A'

puts company1.name

puts Email.count

Email.create(email: "HAMBURGSUDsadagamil.com", company: company1).errors

puts Email.count



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