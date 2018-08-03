# place data for testing here!
############### Movements #################

@movement1 = Movement.new(name: "Neck", section: "Head")
@movement1.exercises << Exercise.new(title: "Humming")
@movement1.save
@movement2 = Movement.new(name: "Nose", section: "Head")
@movement2.exercises << Exercise.new(title: "Smell")
@movement2.save
@movement3 = Movement.new(name: "Ears", section: "Head")
@movement3.exercises << Exercise.new(title: "Hearing")
@movement3.save
@movement4 = Movement.new(name: "Mouth", section: "Head")
@movement4.exercises << Exercise.new(title: "Tongue shapes")
@movement4.save
@movement5 = Movement.new(name: "Chin", section: "Head")
@movement5.exercises << Exercise.new(title: "Table chin hold")
@movement5.save
@movement6 = Movement.new(name: "Eyes", section: "Head")
@movement6.exercises << Exercise.new(title: "Track the ball (Don't move head)")
@movement6.save
@movement7 = Movement.new(name: "Forehead", section: "Head")
@movement7.exercises << Exercise.new(title: "Wrestlers forehead drill")
@movement7.save
@movement8 = Movement.new(name: "Face", section: "Head")
@movement8.exercises << Exercise.new(title: "Goofy faces")
@movement8.save

@movement9 = Movement.new(name: "Shoulder", section: "Upper_Body")
@movement9.exercises << Exercise.new(title: "Lateral Raises")
@movement9.save
@movement10 = Movement.new(name: "Chest", section: "Upper_Body")
@movement10.exercises << Exercise.new(title: "Bench Press")
@movement10.save
@movement11 = Movement.new(name: "Upper Back", section: "Upper_Body")
@movement11.exercises << Exercise.new(title: "Dumbell shoulder shrugs")
@movement11.save
@movement12 = Movement.new(name: "Upper Arm", section: "Upper_Body")
@movement12.exercises << Exercise.new(title: "Bicep curl")
@movement12.save
@movement13 = Movement.new(name: "Forearm", section: "Upper_Body")
@movement13.exercises << Exercise.new(title: "Wrist curls")
@movement13.save
@movement14 = Movement.new(name: "Hands", section: "Upper_Body")
@movement14.exercises << Exercise.new(title: "Open/Close hands rapidly")
@movement14.save

@movement15 = Movement.new(name: "Abdominals", section: "Core")
@movement15.exercises << Exercise.new(title: "Crunches")
@movement15.save
@movement16 = Movement.new(name: "Lower Back", section: "Core")
@movement16.exercises << Exercise.new(title: "Good mornings")
@movement16.save
@movement17 = Movement.new(name: "Obliques", section: "Core")
@movement17.exercises << Exercise.new(title: "Captain's Chair")
@movement17.save
@movement18 = Movement.new(name: "Transverse", section: "Core")
@movement18.exercises << Exercise.new(title: "Birdog")
@movement18.save

@movement19 = Movement.new(name: "Hips", section: "Lower_Body")
@movement19.exercises << Exercise.new(title: "Hip Throw")
@movement19.save
@movement20 = Movement.new(name: "Upper Leg", section: "Lower_Body")
@movement20.exercises << Exercise.new(title: "Lunges")
@movement20.save
@movement21 = Movement.new(name: "Lower Leg", section: "Lower_Body")
@movement21.exercises << Exercise.new(title: "Calf raises")
@movement21.save
@movement22 = Movement.new(name: "Feet", section: "Lower_Body")
@movement22.exercises << Exercise.new(title: "Towel grab")
@movement22.save

@movement23 = Movement.new(name: "Swinging", section: "Movement")
@movement23.exercises << Exercise.new(title: "Russian Swing")
@movement23.save
@movement24 = Movement.new(name: "Strength", section: "Movement")
@movement24.exercises << Exercise.new(title: "Snatch")
@movement24.save
@movement25 = Movement.new(name: "Endurence", section: "Movement")
@movement25.exercises << Exercise.new(title: "Running")
@movement25.save
@movement26 = Movement.new(name: "Power/Plyo", section: "Movement")
@movement26.exercises << Exercise.new(title: "Jumping")
@movement26.save
@movement27 = Movement.new(name: "Body Weight", section: "Movement")
@movement27.exercises << Exercise.new(title: "Planche")
@movement27.save
@movement28 = Movement.new(name: "Climbing", section: "Movement")
@movement28.exercises << Exercise.new(title: "Bouldering")
@movement28.save
@movement29 = Movement.new(name: "Swimming", section: "Movement")
@movement29.exercises << Exercise.new(title: "Lap swimming")
@movement29.save
@movement30 = Movement.new(name: "Gracefulness", section: "Movement")
@movement30.exercises << Exercise.new(title: "Ballet")
@movement30.save
@movement31 = Movement.new(name: "Meditation", section: "Movement")
@movement31.exercises << Exercise.new(title: "Kundilini Yoga")
@movement31.save
@movement32 = Movement.new(name: "Mobility", section: "Movement")
@movement32.exercises << Exercise.new(title: "Splits")
@movement32.save
@movement33 = Movement.new(name: "Balance", section: "Movement")
@movement33.exercises << Exercise.new(title: "Skateboarding")
@movement33.save
@movement34 = Movement.new(name: "Iron Body", section: "Movement")
@movement34.exercises << Exercise.new(title: "Shin Conditioning - Muay Thai")
@movement34.save
@movement35 = Movement.new(name: "Tumbling", section: "Movement")
@movement35.exercises << Exercise.new(title: "Back flip")
@movement35.save

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
Exercise.all.each {|exercise| @user1.exercises << exercise}
@user1.save

@user2 = User.new(username: "Nadia", email: "east@gmail.com", password: "blue")
@user2.update(residence: "Boulder", fitness_level: "A", professional: "false")
@user2.fitness_modalities << @fitness3
@user2.fitness_modalities << @fitness2
@user2.posts << @post3
@user2.posts << @post1
Exercise.all.each {|exercise| @user2.exercises << exercise if exercise.id < 20 && exercise.id > 10}
@user2.save

@user3 = User.new(username: "Rhys", email: "wolf@gmail.com", password: "blue")
@user3.update(residence: "Palo Alto", fitness_level: "N", professional: "false")
@user3.fitness_modalities << FitnessModality.new(name: "Animal Movements")
@user3.posts << @post7
Exercise.all.each {|exercise| @user3.exercises << exercise if exercise.id > 20}
@user3.save

@user4 = User.new(username: "Bear", email: "manjiare@gmail.com", password: "blue")
@user4.update(residence: "Mexico", fitness_level: "I", professional: "true")
@user4.fitness_modalities << FitnessModality.new(name: "Gardening")
@user4.fitness_modalities << FitnessModality.new(name: "Cold Temperature Breathing")
@user4.posts << @post6
@user4.posts << @post5
@user4.posts << @post8
Exercise.all.each {|exercise| @user4.exercises << exercise if exercise.id < 10 && exercise.id > 20}
@user4.save

@user5 = User.new(username: "Sonia", email: "pepe@gmail.com", password: "blue")
@user5.update(residence: "El Salvador", fitness_level: "N", professional: "false")
@user5.fitness_modalities << @fitness1
@user5.fitness_modalities << FitnessModality.new(name: "Foot Volleyball")
@user5.posts << @post4
Exercise.all.each {|exercise| @user5.exercises << exercise if exercise.id < 10}
@user5.save

############## NEWS ###################

@news1 = News.new(title: "Beer Yoga", content: "Have you heard of beer Yoga? Checkout the new trend to help calm you down so you can then
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
