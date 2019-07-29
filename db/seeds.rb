Museum.destroy_all
User.destroy_all

renwick = Museum.create(name: "Renwick Gallery", address: "1661 Pennsylvania Ave NW")
portrait = Museum.create(name: "Portrait Gallery", address: "8th and F Sts NW")

harum = User.create(username: "harum")
carlos = User.create(username: "skamateria")

visit1 = Visit.create(user_id: harum.id, museum_id: renwick.id, visited: true)
visit2 = Visit.create(user_id: carlos.id, museum_id: renwick.id, visited: true)
visit3 = Visit.create(user_id: harum.id, museum_id: portrait.id, visited: false)

