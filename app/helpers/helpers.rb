class Helpers
  def self.is_logged_in?(arg)
    if arg[:user_id] != nil
      true
    else
      false
    end
  end

  def self.current_user(arg)
    @user = User.find(arg[:user_id])
    @user
  end

  def self.registered?(arg)                         #has the user completed the about_me section
    @user = User.find(arg[:user_id])
    if @user.residence == nil
      false
    elsif @user.professional == nil
      false
    elsif @user.fitness_level == nil
      false
    elsif @user.fitness_modalities == nil
      false
    else
      true
    end
  end

  def self.valid_data?(arg)                         #does params from get '/about_me' contain valid information
    if arg[:residence] == nil
      false
    elsif arg[:professional] == nil
      false
    elsif arg[:fitness_level] == nil
      false
    elsif arg[:modalities] == nil && arg[:modality_name].empty?
      false
    else
      true
    end
  end
end
