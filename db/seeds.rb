# place data for testing here!

############### FITNESS MODALITIES ####################

@fitness1 = FitnessModality.new(name: "Gymnastics")
@fitness1.save
@fitness2 = FitnessModality.new(name: "Martial Arts")
@fitness2.save
@fitness3 = FitnessModality.new(name: "Basketball")
@fitness3.save

############ POSTS ################

@post1 = Post.new(content: "I reached my goal I'm so happy")
@post1.save

@post2 = Post.new(content: "Checking out my chiseled bod in the mirror")
@post2.save

@post3 = Post.new(content: "Has anyone heard of the new supplement that contains 20mg of skunk fat!")
@post3.save

@post4 = Post.new(content: "Injured myself last night trying to balance on a ab-roller while on the treadmill. smh!")
@post4.save

@post5 = Post.new(content: "Focusing on tensing my body at all times so that I am constantly in a state of readiness. People seem to be laughing at me though. Go fig!")
@post5.save

@post6 = Post.new(content: "Just delivered my new baby 'Aggamenmond' and am now eating the placenta and umbilical cord for quick recovery. Yummmmy!")
@post6.save

@post7 = Post.new(content: "Ate my super-high protein shake too quickly and have now been constipated for 2 weeks. Any suggestions?")
@post7.save

@post8 = Post.new(content: "Wow do you see the broom sweeping championships! I have never seen a player with such a large sweeping angle. He's the goat! Daddy!")
@post8.save

############### USER ################

@user1 = User.new(username: "Joseph", email: "blackbelt@gmail.com", password: "blue")
@user1.update(residence: "Los Angeles", fitness_level: "E", professional: "true")
@user1.fitness_modalities << @fitness1
@user1.posts << @post2
@user1.save

@user2 = User.new(username: "Nadia", email: "east@gmail.com", password: "blue")
@user2.update(residence: "Boulder", fitness_level: "A", professional: "false")
@user2.fitness_modalities << @fitness3
@user2.fitness_modalities << @fitness2
@user2.posts << @post3
@user2.posts << @post1
@user2.save

@user3 = User.new(username: "Rhys", email: "wolf@gmail.com", password: "blue")
@user3.update(residence: "Palo Alto", fitness_level: "N", professional: "false")
@user3.fitness_modalities << FitnessModality.new(name: "Animal Movements")
@user3.posts << @post7
@user3.save

@user4 = User.new(username: "Bear", email: "manjiare@gmail.com", password: "blue")
@user4.update(residence: "Mexico", fitness_level: "I", professional: "true")
@user4.fitness_modalities << FitnessModality.new(name: "Gardening")
@user4.fitness_modalities << FitnessModality.new(name: "Cold Temperature Breathing")
@user4.posts << @post6
@user4.posts << @post5
@user4.posts << @post8
@user4.save

@user5 = User.new(username: "Sonia", email: "pepe@gmail.com", password: "blue")
@user5.update(residence: "El Salvador", fitness_level: "N", professional: "false")
@user5.fitness_modalities << @fitness1
@user5.fitness_modalities << FitnessModality.new(name: "Foot Volleyball")
@user5.posts << @post4
@user5.save

############## NEWS ###################

@news1 = News.new(title: "Beer Yoga" , content: "Have you heard of beer Yoga? Checkout the new trend to help calm you down so you can then
properly absorb all the soothing relaxing yoga poses.")
@news1.save

@news2 = News.new(title: "Baby Swining", content: "Swing my baby. The long lost art of baby throwing. Watch these masters swing and toss babies
in the air to promote family bonding.")
@news2.save

@news3 = News.new(title: "You're wrong, get over it!", content: "Science says you're moving wrong, so stop it and move the right way.")
@news3.save

@news4 = News.new(title: "Third Eye of the GI", content: "Use these exercises to open the newly discovered third eye of your gut. Practitioners swear that after two weeks you'll be thinking, eating, and moving twice as fast.")
@news4.save

@news5 = News.new(title: "Wooden board mattress", content: "Do you suffer from sleeping problems. Well, it could be your bed. Switch from the fluffy, cloud like mattresses to a strong unchangeable wooded board to alleviate your back pain.")
@news5.save

@news6 = News.new(title: "If I could only have a brain", content: "Non-meat-eaters beware, studies show plants are conscious too. Hey I'm alive over here!")
@news6.save

@news7 = News.new(title: "Are you listening to the words coming out of my mouth!", content: "Self-proclaimed fitness master claims there is no right or wrong way to move. All that matters is how much are you paying attention. So minimize your distractions during your workouts.")
@news7.save
