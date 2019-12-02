Museum.destroy_all
User.destroy_all
Visit.destroy_all

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

