module SessionsHelper
  #User session data
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  #Finder Question session data
  def set_question(question)
    session[:finder_id] = question.id
    set_count
  end

  def current_question
    @current_question ||= Finder.find_by(id: session[:finder_id])
  end

  #Item session data
  def set_image_array(images)
    images.each_with_index do |image, index|
      session[index] = image.id
    end
  end

  def image_id_at_index(index)
    session[index]
  end

  #Count
  def set_count(value = 1)
    session[:count] = value
  end

  def increment_count
    session[:count] = (session[:count].to_i+1).to_s
  end

  def current_count
    session[:count]
  end
end
