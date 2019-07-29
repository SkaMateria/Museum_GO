Museum.destroy_all
User.destroy_all

require 'csv'
# takes csv file and creates a database object for specific rows
# csv file is lib/seeds/Museums_in_DC.csv
csv_text = File.read(Rails.root.join('lib', 'seeds', 'Museums_in_DC.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
t = Museum.new
#name matches name in Museum model and row['text'] matches the name of the row in csv file
t.name = row['LABEL']
t.address = row['MAR_MATCHADDRESS']
t.save
puts "#{t.name}, #{t.address} saved"
end
#outputs how many museums were created after seeding
puts "There are now #{Museum.count} rows in the transactions table"
 





# renwick = Museum.create(name: "Renwick Gallery", address: "1661 Pennsylvania Ave NW")
# portrait = Museum.create(name: "Portrait Gallery", address: "8th and F Sts NW")

harum = User.create(username: "harum")
carlos = User.create(username: "skamateria")

visit1 = Visit.create(user_id: harum.id, museum_id: 256, visited: true)
visit2 = Visit.create(user_id: carlos.id, museum_id: 257, visited: true)
visit3 = Visit.create(user_id: harum.id, museum_id: 258, visited: false)

