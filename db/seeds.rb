# place data for testing here!
@fitness1 = FitnessModality.new(name: "Gymnastics")
@fitness1.save
@fitness2 = FitnessModality.new(name: "Martial Arts")
@fitness2.save
@fitness3 = FitnessModality.new(name: "Basketball")
@fitness3.save

@user1 = User.new(username: "Joseph", email: "blackbelt@gmail.com", password: "blue")
@user1.update(residence: "Los Angeles", fitness_level: "E", professional: "true")
@user1.fitness_modalities << @fitness1
@user1.save

@user2 = User.new(username: "Nadia", email: "east@gmail.com", password: "blue")
@user2.update(residence: "Boulder", fitness_level: "A", professional: "false")
@user2.fitness_modalities << @fitness3
@user2.fitness_modalities << @fitness2
@user2.save

@user3 = User.new(username: "Rhys", email: "wolf@gmail.com", password: "blue")
@user3.update(residence: "Palo Alto", fitness_level: "N", professional: "false")
@user3.fitness_modalities << FitnessModality.new(name: "Animal Movements")
@user3.save

@user4 = User.new(username: "Bear", email: "manjiare@gmail.com", password: "blue")
@user4.update(residence: "Mexico", fitness_level: "I", professional: "true")
@user4.fitness_modalities << FitnessModality.new(name: "Gardening")
@user4.fitness_modalities << FitnessModality.new(name: "Cold Temperature Breathing")
@user4.save

@user5 = User.new(username: "Sonia", email: "pepe@gmail.com", password: "blue")
@user5.update(residence: "El Salvador", fitness_level: "N", professional: "false")
@user5.fitness_modalities << @fitness1
@user5.fitness_modalities << FitnessModality.new(name: "Foot Volleyball")
@user5.save
