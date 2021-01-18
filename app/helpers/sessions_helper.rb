module SessionsHelper
  def log_in(user)
    session[:id] = user.id
  end

  def log_out
    session[:id] = nil
  end
end