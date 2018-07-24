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

  def self.registered?(arg)
    @user = User.find(arg[:user_id])
    if @user.residence == nil
      false
    elsif @user.professional == nil
      false
    elsif @user.fitness_level == nil
      false
    elsif @user.fitness_modalities.size == 0
      false
    else
      true
    end
  end

end
