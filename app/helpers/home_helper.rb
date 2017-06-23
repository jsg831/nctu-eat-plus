module HomeHelper
  def username_of(user)
    user.email.split('@').first
  end
end
