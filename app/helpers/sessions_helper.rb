module SessionsHelper
   # Remembers a user in a persistent session.
   def remember(user)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    return unless (user_id = cookies.signed[:user_id])

    user = User.find_by(id: user_id)
    return unless user&.authenticated?(cookies[:remember_token])
    current_user_equal(user)
  end

  def current_user_equal(user)
    # puts "#{user.id}"
    @current_user = user
    @current_user
  end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    # session.delete(:user_id)
    cookies.signed[:user_id] = nil
    cookies[:remember_token] = nil
    @current_user = nil
  end
end

