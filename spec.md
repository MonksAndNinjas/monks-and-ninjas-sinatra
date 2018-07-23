# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      Added Sinatra, sinatra-activerecord to the gemfile and allowed the controllers to inherit from the Sinatr::Base where all requests and responses will be handled.

- [x] Use ActiveRecord for storing information in a database
      Added Sinatra-ActiveRecord, and ActiveRecord to the gemfile. In the db/migrate directory, I created migrations that create tables
      for users, posts, add_columns, fitness_modalities, user_fitness_modalities join table, and news table. From here I created models folder where the classes inherit from the ActiveRecord::Base.

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
      In my models folder you will find rb files for classes (1)Fitness_modality, (2)News, (3)Post, (4)User_Fitness_Modality, and (5)User.

- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
      My user model contains three has many relationships. (1)has_many posts, (2)has_many user_fitness_modalities, and (3)has_many fitness_modalities.

- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
      My user_fitness_modality and post class both contain belongs_to relationships. (1)belongs_to fitness_modality, (2)belongs_to user, and (3)belongs_to user in post.rb.

- [x] Include user accounts
      Enabeled and set sessions so that user activity can be tracked by creating a user account.

- [x] Ensure that users can't modify content created by other users
      First, users must be logged in to view any user page. This is accomplished by using helpers methods such as Helpers.is_logged_in?(session) that are called on when using get requests that can be found in users and posts controllers.

      Second, methods are used within the ERB file to display modification links only if the user id of that information is equal to the user id of the sessions hash.

      Models names for the resources whose editing is limited include User, Posts, and FitnessModality.

      FitnessModality can only be edited in the about_me user page.

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      Posts contains get, post, patch, delete routes. User contains get, post, and patch routes, but not destroy.

- [ ] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
