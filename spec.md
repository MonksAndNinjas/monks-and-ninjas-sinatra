# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      Added Sinatra, sinatra-activerecord to the gemfile and allowed the controllers to inherit from the Sinatr::Base where all requests and responses will be handled. 

- [x] Use ActiveRecord for storing information in a database
      Added Sinatra-ActiveRecord, and ActiveRecord to the gemfile. In the db/migrate directory, I created migrations that create tables
      for users, posts, add_columns, fitness_modalities, user_fitness_modalities join table, and news table. From here I created models folder where the classes inherit from the ActiveRecord::Base.

- [ ] Include more than one model class (list of model class names e.g. User, Post, Category)
- [ ] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
- [ ] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
- [ ] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
