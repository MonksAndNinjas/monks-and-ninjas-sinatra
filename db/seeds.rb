# place data for testing here!
@fitness1 = FitnessModality.new(name: "Gymnastics")
@fitness1.save
@fitness2 = FitnessModality.new(name: "Martial Arts")
@fitness2.save
@fitness3 = FitnessModality.new(name: "Basketball")
@fitness3.save

@user1 = User.new(username: "Joseph", email: "blackbelt@gmail.com", password_digest: "blue")
@user1.update(residence: "Los Angeles", fitness_level: "E", professional: "true")
@user1.save

@user2 = User.new(username: "Nadia", email: "east@gmail.com", password_digest: "blue")
@user2.update(residence: "Boulder", fitness_level: "A", professional: "false")
@user2.save

@user3 = User.new(username: "Rhys", email: "wolf@gmail.com", password_digest: "blue")
@user3.update(residence: "Palo Alto", fitness_level: "N", profeesional: "false")
@user3.save

@user4 = User.new(username: "Bear", email: "manjiare@gmail.com", password_digest: "blue")
@user4.update(residence: "Mexico", fitness_level: "I", professional: "true")
@user4.save
